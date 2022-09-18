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
        NewsModel(newsImages: #imageLiteral(resourceName: "abdeconomics"), newsLabels: "USA Economics",newsDetails: "Bir geminin batacağını iddia eden adamlar, her ne hikmetse bu gemiye binebilmek için birbirini telef edecek tiyniyette insanlar.ben de sevmiyorum abd'yi, ama bundan ötürü akıl dışı beklentilere de girmiyorum.ailemin geleceğine dair planlarımı mahalledeki varlıklı birinin çöküşü üzerine kurgulamıyorum. abd, dediğiniz gibi çökebilir veya eski gücünü kaybedebilir, peki bu senin kurtuluşun olacak mı? ingiltere 80 sene öncesine kadar dünyayı domine eden ülkeydi, o bu vasfını kaybedince sen büyüdün mü?"),
        NewsModel(newsImages: #imageLiteral(resourceName: "gta6"), newsLabels: "GTA 6",newsDetails: "GTA forums'a bir sızıntı düştü, eleman baya 3 gb'a yakın veri paylaşmış. söylediğine göre uber'ı hackleyen elemanmış kendisi ve doğruluğu tartışılır. açıkçası şu zamana kadar gördüğüm en gerçekçi sızıntılardan biri."),
        NewsModel(newsImages: #imageLiteral(resourceName: "senolgunes"), newsLabels: "SenolGunes",newsDetails: "bir beşiktaşlı olarak en rahat sezonları gordon milne'den sonra şenol güneş ile izlemişimdir statta. dorde miliç, miloş milutonoviç dahil şenol hoca gidene kadar bütün maçlara giden bir kişi olarak söylüyorum ha birde mircea lucescu'nun ilk sezonu. ikinci sezonunda kendisine yapılanları aynı şenol güneş'te olduğu gibi tarih yazacaktır. futbolu seven biri olarak şenol hocayı beşiktaş için önemli bir değer olarak görmekteyim."),
        NewsModel(newsImages: #imageLiteral(resourceName: "kingcharles"), newsLabels: "King Charles",newsDetails: "Bana göre külliyen anlamsız olan ama kendi içinde tarihe dayanan bir anlam taşıyan kurumun başına geçmiş olan kralı usanmadan milletin elini sıkarken izliyorum şu anda. arada afrika asıllı vatandaşları da es geçmemesi hoşuma gitti.bırakalım mutlu olsunlar.saçmalık da olsa insanları mutlu ediyorsa çok da karşı değilim doğrusu."),
        NewsModel(newsImages: #imageLiteral(resourceName: "houseofthedragon"), newsLabels: "HOTD",newsDetails: "Anlık gidişatına bakılırsa kaynak materyale got'tan daha sadık kalan dizi.Drama ve taht oyunları arayıp da bulamayanları sükunete davet ediyorum. 6 bölüm daha var, time jump olacak vesaire ve daha asıl olaya girmedik bile. bu izledikleriniz sadece ısınma turlarıydı. final verdiğinde game of thrones'u aratmayacak, ağzımızda kalan acı/iğrenç tadı silip atacak potansiyelde bir yapım varmış karşımızda meğerse.")]
    
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
        vc?.selectedDetail = newsModel[indexPath.row].newsDetails
        vc?.selectedTitle = newsModel[indexPath.row].newsLabels
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
