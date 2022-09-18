//
//  DetailViewController.swift
//  Homework2-eneskaya
//
//  Created by Enes Kaya on 18.09.2022.
//

import UIKit

//Detail View definitions
class DetailViewController: UIViewController {
    
    // Detail view components
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    // Webview variable
    var webView = webTemplateViewController()
    
    //Variable for data transfer
    var selectedImageView = UIImage()
    var selectedNews : String = ""
    var selectedTag : Int = 0
    var selectedTitle : String = ""
    var selectedDetail : String = ""
    var stringValue: String?
    var titleValue: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Detail view navigation title
        self.navigationItem.title = selectedTitle
        
        //showing transfer data on the detail view
        detailLabel.text = selectedDetail
        imageView.image = selectedImageView
        
    }
    
    //More information button clicked function
    @IBAction func detailButtonClicked(_ sender: Any) {
        
        toTheWebView(tag: selectedTag)
    }
    
    //Navigate the webview controller
    func viewPusher() -> webTemplateViewController {
        webView = self.storyboard?.instantiateViewController(identifier: "webTemplateViewController") as! webTemplateViewController
        self.navigationController?.pushViewController(webView, animated: true)
        
        return webView
    }
    
    //Which news to show control flow
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
