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
    
    var webView = webTemplateViewController()
    
    var selectedImageView = UIImage()
    var selectedNews : String = ""
    var selectedTag : Int = 0
    var selectedDetail : String = ""
    var stringValue: String?
    var titleValue: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        detailLabel.text = selectedDetail
        imageView.image = selectedImageView
        
    

        // Do any additional setup after loading the view.
    }
    
    @IBAction func detailButtonClicked(_ sender: Any) {
        
        toTheWebView(tag: selectedTag)
    }
    
    func viewPusher() -> webTemplateViewController {
        webView = self.storyboard?.instantiateViewController(identifier: "webTemplateViewController") as! webTemplateViewController
        self.navigationController?.pushViewController(webView, animated: true)
        
        return webView
    }
    
    func toTheWebView(tag : Int) {
        
        webView = viewPusher()
        
        if tag == 0 {
            webView.stringValue = "USA Economics"
            webView.titleValue = "USA Economics"
        }
        if tag == 1 {
            webView.stringValue = "GTA 6"
            webView.titleValue = "GTA 6"
        }
        if tag == 2 {
            webView.stringValue = "SenolGunes"
            webView.titleValue = "SenolGunes"
        }
        if tag == 3 {
            webView.stringValue = "King Charles"
            webView.titleValue = "King Charles"
        }
        if tag == 4 {
            webView.stringValue = "House Of The Dragon"
            webView.titleValue = "House Of The Dragon"
        }
    
    
   

}
    
}
