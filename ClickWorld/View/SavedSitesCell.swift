//
//  SavedSitesCell.swift
//  Ni Hao World
//
//  Created by Paramveer Singh on 30/09/23.
//

import UIKit

class SavedSitesCell: UITableViewCell {
    @IBOutlet var mainView: UIView!
    @IBOutlet var lblAddress: UILabel!
    
    @IBOutlet var lblDesc: UILabel!
    @IBOutlet var lblName: UILabel!
    @IBOutlet var btnDelete: UIButton!
    @IBOutlet var lblDate: UILabel!
    @IBOutlet var imgMain: UIImageView!
    @IBOutlet var imgView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        mainView.layer.cornerRadius = 12
        mainView.setShadow()
        imgMain.layer.cornerRadius = imgMain.frame.height / 2
        imgView.setShadow()
        imgView.layer.cornerRadius = imgView.frame.height / 2
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
