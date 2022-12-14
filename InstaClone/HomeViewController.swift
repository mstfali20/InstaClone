//
//  HomeViewController.swift
//  InstaClone
//
//  Created by Mustafa Ali KILCI on 29.11.2022.
//

import UIKit
import FirebaseFirestore
import SDWebImage

class HomeViewController: UIViewController,UITableViewDelegate , UITableViewDataSource{


    
    
    /*
     cell.nametext.text = "asd"
     cell.datetext.text = "asd"
     cell.useremailtext.text = "asd"
     cell.likeIntText.text = "2"
     cell.dislikeIntText.text = "3"
     cell.imageview.image = UIImage(named: "uploadd")
     */
    
    var userEmailArry = [String]()
    var dateArry = [Date]()
    var nameArry = [String]()
    var likelArry = [Int]()
    var dislikeArry = [Int]()
    var imageArry = [String]()
    
    var documantIDArry=[String]()
    
    @IBOutlet weak var tableview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableview.delegate = self
        tableview.dataSource = self
        getDataFromFiristore()

        // Do any additional setup after loading the view.
    }
    
    
    func getDataFromFiristore (){
        
        let firistore = Firestore.firestore()
        /*
        let settings = firistore.settings
        firistore.settings = settings
         
         document.get("imageUrl")
         document.get("postComment")
         document.get("Date")
         document.get("like")
         
         
         */
        
        firistore.collection("Posts").order(by: "Date", descending: true).addSnapshotListener { snapshot, error in
            if error != nil{
                print(error?.localizedDescription)
                
            }else{
                
                if snapshot?.isEmpty != true && snapshot != nil{
                    
                    self.imageArry.removeAll(keepingCapacity: false)
                    self.userEmailArry.removeAll(keepingCapacity: false)
                    self.nameArry.removeAll(keepingCapacity: false)
                    self.likelArry.removeAll(keepingCapacity: false)
                    self.dislikeArry.removeAll(keepingCapacity: false)
                    self.dateArry.removeAll(keepingCapacity: false)
                    self.documantIDArry.removeAll(keepingCapacity: false)
                    
                    
                    
                    for document in snapshot!.documents {
                        let documentID = document.documentID
                        self.documantIDArry.append(documentID)
                        
                        
                        if let postedby = document.get("postetby") as? String{
                            self.userEmailArry.append(postedby)
                        }
                        if let postComment = document.get("postComment") as? String{
                            self.nameArry.append(postComment)
                        }
                        if let imageUrl = document.get("imageUrl") as? String{
                            self.imageArry.append(imageUrl)
                        }
                        if let postlike = document.get("like") as? Int{
                            self.likelArry.append(postlike)
                        }
                        if let postdistlike = document.get("dislike") as? Int{
                            self.dislikeArry.append(postdistlike)
                        }
                        
                        if let postdate = document.get("Date") as? Date{
                        
                            self.dateArry.append(postdate)
                            
                        }
                       
                       
                    }
                    
                    self.tableview.reloadData()
                }
            }
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userEmailArry.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! HomeCell
        cell.nametext.text = nameArry[indexPath.row]
        cell.datetext.text = ""
        cell.useremailtext.text = userEmailArry[indexPath.row]
        cell.likeIntText.text = String(likelArry[indexPath.row])
        cell.dislikeIntText.text =  String(dislikeArry[indexPath.row])
        cell.imageview.sd_setImage(with: URL(string: self.imageArry[indexPath.row]))
        cell.documentId.text = String(documantIDArry[indexPath.row])
        return cell
    }
 
    

}
