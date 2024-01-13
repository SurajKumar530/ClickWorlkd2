//
//  CreateProfileVC.swift
//  Ni Hao World
//
//  Created by Paramveer Singh on 23/05/23.
//

import UIKit

class CreateRecipeVC: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate{

    @IBOutlet var imgProfile: UIImageView!
    @IBOutlet var btnSignUp: UIButton!
    @IBOutlet var tfName: UITextField!
    @IBOutlet var tfDescription: UITextField!
    @IBOutlet var viewDownMain: UIView!
    @IBOutlet var btnImage: UIButton!
    @IBOutlet var tfRating: UITextField!
    @IBOutlet var imageViewMain: UIView!
    var photoUploaded = false
    var imageMain = UIImage.init()
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self

        viewDownMain.layer.cornerRadius = 25
        viewDownMain.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        btnImage.layer.cornerRadius = btnImage.frame.height / 2
        imgProfile.layer.cornerRadius = imgProfile.frame.height / 2
        imageViewMain.layer.cornerRadius = imageViewMain.frame.height / 2
        imageViewMain.setShadow()
        tfName.layer.cornerRadius = 2
        tfName.layer.borderWidth = 1
        tfName.layer.borderColor = UIColor.systemGray2.cgColor
        tfName.setLeftPaddingPoints(10)

        tfDescription.layer.cornerRadius = 2
        tfDescription.layer.borderWidth = 1
        tfDescription.layer.borderColor = UIColor.systemGray2.cgColor
        tfDescription.setLeftPaddingPoints(10)

        tfRating.layer.cornerRadius = 2
        tfRating.layer.borderWidth = 1
        tfRating.layer.borderColor = UIColor.systemGray2.cgColor
        tfRating.setLeftPaddingPoints(10)


        btnSignUp.layer.cornerRadius = btnSignUp.frame.height / 2
        btnSignUp.setTitle("Save", for: .normal)
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnSave(_ sender: UIButton) {
        if photoUploaded == false
        {
            AlertView.showAlert(view: self, title: "Alert!", message: "Please Upload Photo!")
            return

        }
        if tfName.text == ""
        {
            AlertView.showAlert(view: self, title: "Alert!", message: "Please Enter Name!")
            return
        }
        if tfRating.text == ""
        {
            AlertView.showAlert(view: self, title: "Alert!", message: "Please Enter Rating!")
            return
        }
        if tfDescription.text == ""
        {
            AlertView.showAlert(view: self, title: "Alert!", message: "Please Enter Description!")
            return

        }
        
        dataSavedArray.append(Recipe(image: imageMain.pngData()!, name: tfName.text!,description: tfDescription.text!, rating: tfRating.text!,date : Date.getCurrentDate() ))
        if let encoded = try? JSONEncoder().encode(dataSavedArray) {
            UserDefaults.standard.set(encoded, forKey: dataSavedKey)

        }

        self.navigationController?.popViewController(animated: true)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        dismiss(animated: true, completion: nil)

       
            let image = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        imgProfile.image = image
        imageMain = imgProfile.image!
        photoUploaded = true

      
    }
    @IBAction func btnUploadImg(_ sender: Any) {
        cameraGallery()
    }
    @IBAction func btnBackAct(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    let imagePicker = UIImagePickerController()

    func cameraGallery()
   {
       
       let alert = UIAlertController(title: "Choose Image", message: nil, preferredStyle: .actionSheet)
       alert.addAction(UIAlertAction(title: "Camera", style: .default, handler: { _ in
           self.openCamera()
       }))
       
       alert.addAction(UIAlertAction(title: "Gallery", style: .default, handler: { _ in
           self.openGallary()
       }))
       
       alert.addAction(UIAlertAction.init(title: "Cancel", style: .cancel, handler: nil))
       
       /*If you want work actionsheet on ipad
       then you have to use popoverPresentationController to present the actionsheet,
       otherwise app will crash on iPad */
       switch UIDevice.current.userInterfaceIdiom {
       case .pad:
           alert.popoverPresentationController?.sourceView = self.view
           alert.popoverPresentationController?.sourceRect = self.view.bounds
           alert.popoverPresentationController?.permittedArrowDirections = .up
       default:
           break
       }
       
       self.present(alert, animated: true, completion: nil)
   }
    
    func openCamera()
        {
            if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera) {
                print("Camera Available")
                
                imagePicker.sourceType = UIImagePickerController.SourceType.camera
                self.present(imagePicker, animated: true, completion: nil)
            }
            else
            {
                let alert  = UIAlertController(title: "Warning", message: "You don't have camera", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                self.modalPresentationStyle = .fullScreen
                self.present(alert, animated: true, completion: nil)
            }
        }

        func openGallary()
        {
            imagePicker.sourceType = UIImagePickerController.SourceType.photoLibrary
            imagePicker.allowsEditing = false
            self.modalPresentationStyle = .fullScreen

            self.present(imagePicker, animated: true, completion: nil)
        }
}
