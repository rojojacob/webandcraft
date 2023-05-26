//
//  BannerTableViewCell.swift
//  WebAndCraftEcm
//
//  Created by Rojo Jacob on 26/05/23.
//

import UIKit
import Kingfisher

class BannerTableViewCell: UITableViewCell {

    @IBOutlet weak var bannerCollectionView: UICollectionView!
    private var viewModel: HomeViewModel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        viewModel = HomeViewModel()
        fetchData()
        bannerCollectionView.delegate = self
        bannerCollectionView.dataSource = self
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func fetchData() {
            viewModel?.fetchData { [weak self] success in
                if success {
                    DispatchQueue.main.async {
                        self?.bannerCollectionView.reloadData()
                    }
                } else {
                    // Handle error case
                }
            }
        }

}

extension BannerTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel?.banners.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = bannerCollectionView.dequeueReusableCell(withReuseIdentifier: "BannerCollectionViewCell", for: indexPath) as! BannerCollectionViewCell
            
        let banner = viewModel?.banners[indexPath.row]
        
        
        let bannerImage = URL(string: banner?.bannerURL ?? "" )
        cell.bannerImageView.kf.setImage(with: bannerImage,
                                               placeholder: UIImage(named: "placeholder"),
                                               options: nil,
                                               progressBlock: nil,
                                               completionHandler: nil)

        
       return cell
    }

    
}
