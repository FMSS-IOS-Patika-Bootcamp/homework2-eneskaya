//
//  ViewController.swift
//  Homework2-eneskaya
//
//  Created by Enes Kaya on 18.09.2022.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var choosenNewsName = ""
    var choosenImageView = UIImage()
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    let newsModel: [NewsModel] = [
        NewsModel(newsImages: #imageLiteral(resourceName: "abdeconomics"), newsLabels: "USA Economics",newsDetails: "USA Economics Detail"),
        NewsModel(newsImages: #imageLiteral(resourceName: "gta6"), newsLabels: "GTA 6",newsDetails: "GTA 6 Detail"),
        NewsModel(newsImages: #imageLiteral(resourceName: "senolgunes"), newsLabels: "SenolGunes",newsDetails: "SenolGunes Detail"),
        NewsModel(newsImages: #imageLiteral(resourceName: "kingcharles"), newsLabels: "King Charles",newsDetails: "King Charles Detail"),
        NewsModel(newsImages: #imageLiteral(resourceName: "houseofthedragon"), newsLabels: "HOTD",newsDetails: "House of Dragon Detail")
    ]
    
    @IBOutlet weak var newsCollectionView: UICollectionView!
    
    var webView = webTemplateViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newsCollectionView.delegate = self
        newsCollectionView.dataSource = self
        settingSizeForCollection()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
    }
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return newsModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "detailVC") as? DetailViewController
        vc?.selectedNews = newsModel[indexPath.row].newsLabels
        vc?.selectedImageView = newsModel[indexPath.row].newsImages
        vc?.selectedTag = indexPath.row
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell: NewsCollectionViewCell = newsCollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! NewsCollectionViewCell
        
        cell.configure(model: newsModel[indexPath.row])
        
        /*let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.toTheDetailVC(_:)))
        
        
        cell.isUserInteractionEnabled = true
        cell.contentView.tag = indexPath.row
        cell.contentView.addGestureRecognizer(tapGestureRecognizer)
        
        choosenImageView = cell.newsImage.image ?? UIImage(named: "gta6")!
        choosenNewsName = cell.newsLabel.text ?? "gta6"
       */
        
        return cell
        
        
    }
    @objc func toTheDetailVC(_ sender: AnyObject){
        performSegue(withIdentifier: "toDetailVC", sender: nil)
               
    }
    
    override  func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailVC"{
            let destinationVC = segue.destination as! DetailViewController
            destinationVC.selectedImageView = choosenImageView
            destinationVC.selectedNews = choosenNewsName
            
        }
    }
    
    func viewPusher() -> webTemplateViewController {
        webView = self.storyboard?.instantiateViewController(identifier: "webTemplateViewController") as! webTemplateViewController
        self.navigationController?.pushViewController(webView, animated: true)
        
        return webView
    }
    
    
    @objc func toTheWebView(_ sender: AnyObject) {
        webView = viewPusher()
        
        if sender.view.tag == 0 {
            webView.stringValue = "USA Economics"
            webView.titleValue = "USA Economics"
        }
        if sender.view.tag == 1 {
            webView.stringValue = "GTA 6"
            webView.titleValue = "GTA 6"
        }
        if sender.view.tag == 2 {
            webView.stringValue = "SenolGunes"
            webView.titleValue = "SenolGunes"
        }
        if sender.view.tag == 3 {
            webView.stringValue = "King Charles"
            webView.titleValue = "King Charles"
        }
        if sender.view.tag == 4 {
            webView.stringValue = "House Of The Dragon"
            webView.titleValue = "House Of The Dragon"
        }
   }
    
    func settingSizeForCollection() {
        let itemSize = UIScreen.main.bounds.width / 2 - 2
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
        layout.itemSize = CGSize(width: itemSize, height: itemSize)
        layout.minimumInteritemSpacing = 3
        layout.minimumLineSpacing = 3
        newsCollectionView.collectionViewLayout = layout
    }
}
