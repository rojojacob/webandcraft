//
//  BannerCollectionViewCell.swift
//  WebAndCraftEcm
//
//  Created by Rojo Jacob on 26/05/23.
//

import UIKit

class BannerCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var bannerImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        bannerImageView.layer.cornerRadius = 10
        bannerImageView.clipsToBounds = true
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        bannerImageView.layer.cornerRadius = 10
        bannerImageView.clipsToBounds = true
    }
}
