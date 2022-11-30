//
//  HomeCell.swift
//  InstaClone
//
//  Created by Mustafa Ali KILCI on 30.11.2022.
//

import UIKit

class HomeCell: UITableViewCell {
    @IBOutlet weak var datetext: UILabel!
    
    @IBOutlet weak var likeIntText: UILabel!
    
    
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
    }
    
    @IBAction func dislikebtn(_ sender: Any) {
    }
    
}
