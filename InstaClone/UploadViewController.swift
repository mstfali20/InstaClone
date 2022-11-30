//
//  UploadViewController.swift
//  InstaClone
//
//  Created by Mustafa Ali KILCI on 29.11.2022.
//

import UIKit
import FirebaseStorage
import FirebaseFirestore
import FirebaseAuth

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
                            
                            
                            
                            //DATABASE
                            
                            let firestoreDatabase = Firestore.firestore()
                            var firestoreRefarance : DocumentReference? = nil
                            let firistorePost = ["imageUrl":imageUrl!, "postetby":Auth.auth().currentUser?.email, "postComment" : self.nametext.text! , "Date":FieldValue.serverTimestamp(), "like" : 0, "dislike" : 0] as [String : Any]
                            
                            firestoreRefarance = firestoreDatabase.collection("Posts").addDocument(data: firistorePost,completion: { (error) in
                                if error != nil {
                                    self.makealert(titleInput: "Error", MesageInput: error?.localizedDescription ?? "Error ")
                                }else{
                                    
                                    self.imageview.image = UIImage(named: "uploadd")
                                    self.nametext.text = ""
                                    self.tabBarController?.selectedIndex = 0
                                }                            })
                            
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
