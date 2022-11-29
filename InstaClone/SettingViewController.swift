//
//  SettingViewController.swift
//  InstaClone
//
//  Created by Mustafa Ali KILCI on 29.11.2022.
//

import UIKit
import FirebaseAuth

class SettingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func logautbtn(_ sender: Any) {
        
        do{
             try Auth.auth().signOut()
            self.performSegue(withIdentifier: "logautVs", sender: nil)
        
        }catch{print("Errorsssssssss" )}
    }
    
    

}
