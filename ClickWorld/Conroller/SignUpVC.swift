//
//  SignUpVC.swift
//  Ni Hao World
//
//  Created by Paramveer Singh on 23/05/23.
//

import UIKit

class SignUpVC: UIViewController {
    @IBOutlet var viewBottom: UIView!
    @IBOutlet var btnStoreNewSite: UIButton!
    var attributedString = NSMutableAttributedString(string:"")
    @IBOutlet var btnSavedSites: UIButton!
    var attrs = [
        NSAttributedString.Key.font : UIFont.systemFont(ofSize: 11),
        NSAttributedString.Key.foregroundColor : ThemeColor,
        NSAttributedString.Key.underlineStyle : 1] as [NSAttributedString.Key : Any]
    override func viewDidLoad() {
        super.viewDidLoad()
        viewBottom.layer.cornerRadius = 25
        viewBottom.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        btnStoreNewSite.layer.cornerRadius = btnStoreNewSite.frame.height / 2
        btnSavedSites.layer.cornerRadius = btnSavedSites.frame.height / 2
        self.navigationController?.isNavigationBarHidden = true

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnBackAct(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
   
    @IBAction func storeNewSiteAct(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "CreateRecipeVC") as! CreateRecipeVC
        self.navigationController?.pushViewController(vc, animated: true)


    }
    @IBAction func savedSiteAct(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "StoredRecipesVC") as! StoredRecipesVC
        self.navigationController?.pushViewController(vc, animated: true)

    }
  
    
   
}
