//
//  ViewController.swift
//  InstaClone
//
//  Created by Mustafa Ali KILCI on 29.11.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var passwordtext: UITextField!
    @IBOutlet weak var emailtext: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func sigininbtn(_ sender: Any) {
        
        
        performSegue(withIdentifier: "toVs", sender: nil)
    }
    
    @IBAction func siginupbtn(_ sender: Any) {
        
    }
}

