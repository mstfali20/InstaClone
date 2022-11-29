//
//  UploadViewController.swift
//  InstaClone
//
//  Created by Mustafa Ali KILCI on 29.11.2022.
//

import UIKit
import FirebaseStorage

class UploadViewController: UIViewController , UIImagePickerControllerDelegate , UINavigationControllerDelegate{
    @IBOutlet weak var imageview: UIImageView!
    
    @IBOutlet weak var nametext: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        imageview.isUserInteractionEnabled = true
        let gesturRecocgnizer = UITapGestureRecognizer(target: self, action: #selector(choseImages))
        imageview.addGestureRecognizer(gesturRecocgnizer)
    }
    
    @objc func choseImages(){
        let pickerController = UIImagePickerController()
        pickerController.delegate = self
        pickerController.sourceType = .photoLibrary
        present(pickerController, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imageview.image = info[.originalImage] as? UIImage
        self.dismiss(animated: true , completion: nil)
    }
    
    @IBAction func savebtn(_ sender: Any) {
        
        let storage = Storage.storage()
        
        let storageRefarance = storage.reference()
        let mediaFolder = storageRefarance.child("media")
        
        if let data = imageview.image?.jpegData(compressionQuality: 0.5){
            let uuid = UUID().uuidString
            let imageRefarance = mediaFolder.child("\(uuid).jpg")
            imageRefarance.putData(data ,metadata: nil) {(metadata, error) in
                if error != nil {
                    self.makealert(titleInput: "ERROR", MesageInput: error?.localizedDescription ?? "Error")
                    
                    
                }else {
                    
                    imageRefarance.downloadURL { (url, error) in
                        if error == nil{
                            let imageUrl = url?.absoluteString
                            print(imageUrl)
                            
                        }
                    }
                }
                
            }
            
        }
        
    }
    func makealert (titleInput:String , MesageInput:String){
        
        let alert = UIAlertController(title: titleInput, message: MesageInput, preferredStyle: UIAlertController.Style.alert)
        let okbuton = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default ,handler: nil)
        alert.addAction(okbuton)
        self.present(alert, animated: true, completion: nil)
    }
    

}
