//
//  ProductTableViewCell.swift
//  WebAndCraftEcm
//
//  Created by Rojo Jacob on 26/05/23.
//

import UIKit
import Kingfisher

class ProductTableViewCell: UITableViewCell {

    @IBOutlet weak var productCollectionview: UICollectionView!
    private var viewModel: HomeViewModel?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        viewModel = HomeViewModel()
        fetchData()
        productCollectionview.dataSource = self
        productCollectionview.delegate = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func fetchData() {
            viewModel?.fetchData { [weak self] success in
                if success {
                    DispatchQueue.main.async {
                        self?.productCollectionview.reloadData()
                    }
                } else {
                    // Handle error case
                }
            }
        }

}

extension ProductTableViewCell : UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel?.products.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell =  productCollectionview.dequeueReusableCell(withReuseIdentifier: "ProductsCollectionViewCell", for: indexPath) as! ProductsCollectionViewCell
        
        let product = viewModel?.products[indexPath.row]
       
        cell.oldPrizeLabel.text = product?.actualPrice
        cell.offerPrizeLabel.text = product?.offerPrice
        cell.productNameLabel.text = product?.name
        cell.offerLabel.text = String(product?.offer ?? 0) + "% OFF"
        
        let productImage = URL(string: product?.image ?? "" )
        cell.productImageView.kf.setImage(with: productImage,
                                               placeholder: UIImage(named: "placeholder"),
                                               options: nil,
                                               progressBlock: nil,
                                               completionHandler: nil)
        
        return cell
    }
    
    
}
