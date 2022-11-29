//
//  ViewController.swift
//  InstaClone
//
//  Created by Mustafa Ali KILCI on 29.11.2022.
//

import UIKit
import FirebaseAuth

class ViewController: UIViewController {

    @IBOutlet weak var passwordtext: UITextField!
    @IBOutlet weak var emailtext: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func sigininbtn(_ sender: Any) {
        
        if emailtext.text != "" && passwordtext.text != "" {
            Auth.auth().signIn(withEmail: emailtext.text!, password: passwordtext.text!) { authdata, error in
                if error != nil {
                    self.makealert(titleInput: "Error", MesageInput: error?.localizedDescription ?? "Error ")
                    
                }else{
                    self.performSegue(withIdentifier: "toVs", sender: nil)
                }
            }
            
            }
        else {
           
            makealert(titleInput: "Error", MesageInput: "Username / Password ?")
        }
        
    }
    
    @IBAction func siginupbtn(_ sender: Any) {
        if emailtext.text != "" && passwordtext.text != "" {
            Auth.auth().createUser(withEmail: emailtext.text!, password: passwordtext.text!) { autdata, error in
                if error != nil {
                    self.makealert(titleInput: "Error", MesageInput: error?.localizedDescription ?? "Error ")
                    
                }else{
                    self.performSegue(withIdentifier: "toVs", sender: nil)
                }
            }
            
        }else {
           
            makealert(titleInput: "Error", MesageInput: "Username / Password ?")
        }
        
    }
    
    func makealert (titleInput:String , MesageInput:String){
        
        let alert = UIAlertController(title: titleInput, message: MesageInput, preferredStyle: UIAlertController.Style.alert)
        let okbuton = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default ,handler: nil)
        alert.addAction(okbuton)
        self.present(alert, animated: true, completion: nil)
    }
}

