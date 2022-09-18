//
//  DetailViewController.swift
//  Homework2-eneskaya
//
//  Created by Enes Kaya on 18.09.2022.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    
    var choosenNews = ""
    var stringValue: String?
    var titleValue: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        loadForWebViewFromServer()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func detailButtonClicked(_ sender: Any) {
    }
    
    func loadForWebViewFromServer() {
    
    if stringValue == "House Of The Dragon" {
        detailLabel.text = "House Of The Dragon"
      //  let image = UIImage(String: "houseofthedragon")
        //imageView.image = image
       
    }
    if stringValue == "GTA 6" {
        
    }
    if stringValue == "SenolGunes" {
      
    }
    if stringValue == "King Charles" {
       
    }
    if stringValue == "USA Economics" {
        
        }
    }
    
   

}
