//
//  ProductsCollectionViewCell.swift
//  WebAndCraftEcm
//
//  Created by Rojo Jacob on 26/05/23.
//

import UIKit
import TinyConstraints

class ProductsCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var productImageView: UIImageView!
    
    @IBOutlet weak var oldPrizeLabel: UILabel!
    
    @IBOutlet weak var offerPrizeLabel: UILabel!
    
    @IBOutlet weak var productNameLabel: UILabel!
    
    @IBOutlet weak var offerLabel: UILabel!
    override func awakeFromNib() {
          super.awakeFromNib()
          addStrikeThroughToOldPrizeLabel()
      }
      
      private func addStrikeThroughToOldPrizeLabel() {
          let attributedText = NSMutableAttributedString(string: oldPrizeLabel.text ?? "")
          attributedText.addAttribute(NSAttributedString.Key.strikethroughStyle,
                                      value: NSUnderlineStyle.single.rawValue,
                                      range: NSMakeRange(0, attributedText.length))
          attributedText.addAttribute(NSAttributedString.Key.strikethroughColor,
                                      value: UIColor.gray,
                                      range: NSMakeRange(0, attributedText.length))
          oldPrizeLabel.attributedText = attributedText
      }
}

