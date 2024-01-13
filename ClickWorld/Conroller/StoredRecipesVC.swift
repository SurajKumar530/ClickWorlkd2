//
//  StoredSitesVC.swift
//  Ni Hao World
//
//  Created by Paramveer Singh on 30/09/23.
//

import UIKit

class StoredRecipesVC: UIViewController, UITextFieldDelegate {
     var cellId = "SavedSitesCell"
    @IBOutlet var tblView: UITableView!
    @IBOutlet var tfSearch: UITextField!
    var FilteredataSavedArray : [Recipe] = []
    var search:String=""

    override func viewDidLoad() {
        super.viewDidLoad()
        tfSearch.delegate = self
        FilteredataSavedArray = dataSavedArray
        DispatchQueue.main.async {
            if(self.FilteredataSavedArray.isEmpty) {
                self.tblView.setEmptyMessage("No results!", "none")
            } else {
                self.tblView.restore()
            }

            self.tblView.reloadData()
        }

        self.tblView.reloadData()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
            let searchText  = textField.text! + string

        if string.isEmpty
        {
            search = String(search.dropLast())
        }
        else
        {
            search=textField.text!+string
        }

        print(search)
        let arr = (dataSavedArray.filter({(($0.name).localizedCaseInsensitiveContains(search))}))
        //!dataSavedArray.filter({$0.name.starts(with: search)})
        print(arr)
        if (search != "")
        {
            FilteredataSavedArray = arr
        }
        else
        {
            FilteredataSavedArray = dataSavedArray

        }

        DispatchQueue.main.async {
            self.tblView.reloadData()
        }
             return true
        }
  

}
extension StoredRecipesVC : UITableViewDelegate,UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return FilteredataSavedArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tableView.register(UINib(nibName: cellId, bundle: nil), forCellReuseIdentifier: cellId)
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId) as! SavedSitesCell
        cell.lblName.text = FilteredataSavedArray[indexPath.row].name
        cell.lblDesc.text = FilteredataSavedArray[indexPath.row].description
        cell.lblAddress.text = "Rating - " + FilteredataSavedArray[indexPath.row].rating
        cell.lblDate.text = FilteredataSavedArray[indexPath.row].date
        cell.imgMain.image = FilteredataSavedArray[indexPath.row].getImage(from: FilteredataSavedArray[indexPath.row].image)
        if search != ""
        {
            cell.btnDelete.isHidden = true
            
        }
        else
        {
            cell.btnDelete.isHidden = false

        }
        cell.btnDelete.tag = indexPath.row

        cell.btnDelete.addTarget(self, action: #selector(deleteMain), for: .touchUpInside)
        cell.selectionStyle = .none
        return cell
    }
    @objc func deleteMain(_ sender : UIButton)
    {
      
        dataSavedArray.remove(at: sender.tag)

        FilteredataSavedArray = dataSavedArray
        if let encoded = try? JSONEncoder().encode(dataSavedArray) {
            UserDefaults.standard.set(encoded, forKey: dataSavedKey)

        }
        DispatchQueue.main.async {
            if(self.FilteredataSavedArray.isEmpty) {
                self.tblView.setEmptyMessage("No results!", "none")
            } else {
                self.tblView.restore()
            }

            self.tblView.reloadData()
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ShowImageVCViewController") as! ShowImageVCViewController
//        vc.imageSite = dataSavedArray[indexPath.row].getImage(from: dataSavedArray[indexPath.row].image)
//        self.present(vc, animated: true)
 
    }

}
