//
//  MyTableViewCell.swift
//  WebAndCraftEcm
//
//  Created by Rojo Jacob on 26/05/23.
//

import UIKit
import Kingfisher

class MyTableViewCell: UITableViewCell {

    @IBOutlet weak var categoryCollectionView: UICollectionView!
    private var viewModel: HomeViewModel?

    override func awakeFromNib() {
        super.awakeFromNib()
       
        viewModel = HomeViewModel()
        fetchData()
        categoryCollectionView.delegate = self
        categoryCollectionView.dataSource = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    func fetchData() {
            viewModel?.fetchData { [weak self] success in
                if success {
                    DispatchQueue.main.async {
                        self?.categoryCollectionView.reloadData()
                    }
                } else {
                    
                }
            }
        }

}

extension MyTableViewCell : UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel?.categories.count ?? 0

    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = categoryCollectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCollectionViewCell", for: indexPath)
        guard let categoryCell = cell as? CategoryCollectionViewCell else { return cell }
        
        let category = viewModel?.categories[indexPath.row]
        
        categoryCell.categoryLabel.text = category?.name
       
        // number of times at which we want to make the color repeat
        let colorIndex = indexPath.item % 5
        
        let color: UIColor
        
        switch colorIndex {
        case 0:
            color = UIColor(red: 247/255, green: 231/255, blue: 231/255, alpha: 1.0)
        case 1:
            color = UIColor(red: 247/255, green: 243/255, blue: 205/255, alpha: 1.0)
        case 2:
            color = UIColor(red: 250/255, green: 241/255, blue: 241/255, alpha: 1.0)
        case 3:
            color = UIColor(red: 231/255, green: 220/255, blue: 242/255, alpha: 1.0)
        case 4:
            color = UIColor(red: 253/255, green: 243/255, blue: 220/255, alpha: 1.0)
        default:
            color = .clear
        }
        
        categoryCell.categoryBackGroundView.backgroundColor = color
        
        let categoryImages = URL(string: category?.imageURL ?? "" )
        categoryCell.categoryImageView.kf.setImage(with: categoryImages,
                                               placeholder: UIImage(named: "placeholder"),
                                               options: nil,
                                               progressBlock: nil,
                                               completionHandler: nil)
        
        return categoryCell
    }
}
