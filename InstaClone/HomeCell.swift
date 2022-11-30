//
//  HomeCell.swift
//  InstaClone
//
//  Created by Mustafa Ali KILCI on 30.11.2022.
//

import UIKit
import FirebaseFirestore
class HomeCell: UITableViewCell {
    @IBOutlet weak var datetext: UILabel!
    
    @IBOutlet weak var likeIntText: UILabel!
    
    
    @IBOutlet weak var documentId: UILabel!
    @IBOutlet weak var dislikeIntText: UILabel!
    
   
    @IBOutlet weak var nametext: UILabel!
    
    @IBOutlet weak var imageview: UIImageView!
    
    @IBOutlet weak var useremailtext: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func likebtn(_ sender: Any) {
        let firistore = Firestore.firestore()
        
        if let likecout = Int(likeIntText.text!){
            let likeStore = ["like" : likecout + 1 ] as [String : Any]
            firistore.collection("Posts").document(documentId.text!).setData(likeStore,merge: true)
            
        }
        
        
        
    }
    
    @IBAction func dislikebtn(_ sender: Any) {
        let firistore = Firestore.firestore()
        
        if let dislikecout = Int(dislikeIntText.text!){
            let dislikeStore = ["dislike" : dislikecout + 1 ] as [String : Any]
            firistore.collection("Posts").document(documentId.text!).setData(dislikeStore,merge: true)
            
        }
    }
    
}
