//
//  CategoryCollectionViewCell.swift
//  WebAndCraftEcm
//
//  Created by Rojo Jacob on 26/05/23.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var categoryView: UIView!
    @IBOutlet weak var categoryImageView: UIImageView!
    @IBOutlet weak var categoryBackGroundView: UIView!
    @IBOutlet weak var categoryLabel: UILabel!
    
    override init(frame: CGRect) {
           super.init(frame: frame)
           categoryImageViewRadius()
       }
       
       required init?(coder: NSCoder) {
           super.init(coder: coder)
           categoryImageViewRadius()
       }
       
       override func layoutSubviews() {
           super.layoutSubviews()
           categoryImageViewRadius()
       }
       
       func categoryImageViewRadius() {
           categoryBackGroundView?.layer.cornerRadius = categoryBackGroundView.bounds.height / 2.1
           categoryBackGroundView?.clipsToBounds = true
       }
   }

