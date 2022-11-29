//
//  UploadViewController.swift
//  InstaClone
//
//  Created by Mustafa Ali KILCI on 29.11.2022.
//

import UIKit

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
        
    }
    

}
