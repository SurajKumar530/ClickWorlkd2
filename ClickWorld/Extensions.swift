//
//  Extensions.swift
//  Ni Hao World
//
//  Created by Paramveer Singh on 23/05/23.
//

import Foundation
import UIKit

extension UIView {
    func setShadow()
    {
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 3.0)
        self.layer.shadowRadius = 2
        self.layer.shadowOpacity = 0.2
        self.layer.masksToBounds = false
        
    }
    
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
          let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
          let mask = CAShapeLayer()
          mask.path = path.cgPath
          layer.mask = mask
      }
}
extension UITextField {
    func setLeftPaddingPoints(_ amount:CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    func setRightPaddingPoints(_ amount:CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }
}





class AlertView: NSObject {
    class func showAlert(view: UIViewController , title: String , message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        view.present(alert, animated: true, completion: nil)
    }
}

extension UITableView {

    func setEmptyMessage(_ message: String, _ image: String) {
        let emptyView: UIView = {
            let emptyView = UIView(frame: CGRect(x: 0, y: 0, width: self.frame.size.width, height: self.frame.size.height))
            return emptyView
        }()

        let contentView: UIView = {
            let contentView = UIView()
            contentView.translatesAutoresizingMaskIntoConstraints = false
            return contentView
        }()

        let messageLabel = UILabel()
        let messageCommentStyle = NSMutableParagraphStyle()
        messageCommentStyle.lineHeightMultiple = 1.2

        let attributedString = NSMutableAttributedString(string: message)
        attributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.black, range: NSRange(location: 0, length: attributedString.length))
        attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value: messageCommentStyle, range: NSRange(location: 0, length: attributedString.length))
        attributedString.addAttribute(NSAttributedString.Key.font, value: UIFont.systemFont(ofSize: 14), range: NSRange(location: 0, length: attributedString.length))

        messageLabel.attributedText = attributedString
        messageLabel.numberOfLines = 0
        messageLabel.font = UIFont.systemFont(ofSize: 14)
        messageLabel.textAlignment = .center
        messageLabel.sizeToFit()
        messageLabel.translatesAutoresizingMaskIntoConstraints = false

        let errorImage: UIImageView = {
            let errorImage = UIImageView()
            errorImage.translatesAutoresizingMaskIntoConstraints = false
            return errorImage
        }()

        self.backgroundView = emptyView

        emptyView.addSubview(contentView)
        contentView.addSubview(errorImage)
        contentView.addSubview(messageLabel)

        contentView.centerYAnchor.constraint(equalTo: emptyView.centerYAnchor).isActive = true
        contentView.centerXAnchor.constraint(equalTo: emptyView.centerXAnchor).isActive = true
        contentView.leadingAnchor.constraint(equalTo: emptyView.leadingAnchor, constant: 10 * 3).isActive = true
        contentView.trailingAnchor.constraint(equalTo: emptyView.trailingAnchor, constant: -(10 * 3)).isActive = true
        contentView.topAnchor.constraint(equalTo: errorImage.topAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: messageLabel.bottomAnchor).isActive = true

        messageLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        messageLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        messageLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
    }

    func restore() {
        self.backgroundView = nil
    }
}

extension Date {

 static func getCurrentDate() -> String {

        let dateFormatter = DateFormatter()

        dateFormatter.dateFormat = "dd/MM/yyyy HH:mm:ss"

        return dateFormatter.string(from: Date())

    }
}
