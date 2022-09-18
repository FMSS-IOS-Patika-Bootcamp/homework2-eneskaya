//
//  SocialCollectionViewCell.swift
//  Homework2-eneskaya
//
//  Created by Enes Kaya on 18.09.2022.
//

import UIKit
//Collection View Cell generate
class NewsCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var newsImage: UIImageView!
    @IBOutlet weak var newsLabel: UILabel!
    
    public func configure( model: NewsModel) {
        newsImage.image = model.newsImages
        newsLabel.text = model.newsLabels
    }
}
