//
//  webTemplateViewController.swift
//  Homework2-eneskaya
//
//  Created by Enes Kaya on 18.09.2022.
//

import UIKit
import WebKit

class webTemplateViewController: UIViewController {
    
    // Web view data transfer values
    var stringValue: String?
    var titleValue: String?
    
    
    @IBOutlet weak var webTemplate: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadForWebViewFromServer()
    }
    //Function for detect correct news url source
    func loadForWebViewFromServer() {
        
        if stringValue == "House Of The Dragon" {
            let url = URL(string: "https://eksisozluk.com/house-of-the-dragon--6230438?a=popular&p=3")
            let request = URLRequest(url: url!)
            webTemplate.load(request)
        }
        if stringValue == "GTA 6" {
            let url = URL(string: "https://eksisozluk.com/grand-theft-auto-vi--2803227?a=popular")
            let request = URLRequest(url: url!)
            webTemplate.load(request)
        }
        if stringValue == "SenolGunes" {
            let url = URL(string: "https://eksisozluk.com/senol-gunes--91730?a=popular&p=6")
            let request = URLRequest(url: url!)
            webTemplate.load(request)
        }
        if stringValue == "King Charles" {
            let url = URL(string: "https://eksisozluk.com/kral-charlesa-isinamiyoruz-diye-bagiran-halk--7411495?a=popular")
            let request = URLRequest(url: url!)
            webTemplate.load(request)
        }
        if stringValue == "USA Economics" {
            let url = URL(string: "https://eksisozluk.com/21-eylul-2022-abd-ekonomik-cokusu--7411753?a=popular")
            let request = URLRequest(url: url!)
            webTemplate.load(request)
        }
    }
}
