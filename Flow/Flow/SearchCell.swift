//
//  SearchCell.swift
//  Flow
//
//  Created by David Chu on 2017/2/4.
//  Copyright © 2017年 SA Tech. All rights reserved.
//

import UIKit

class SearchCell:UICollectionViewCell
{
    @IBOutlet weak var category: UILabel!
    
    let BG_CORNER_RADIUS:CGFloat = 25
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
        roundBackground()
    }
    func configure(category:String)
    {
        self.category.text = category
    }
    private func roundBackground()
    {
        contentView.layer.backgroundColor = UIColor.lightGray.cgColor
        contentView.layer.cornerRadius = BG_CORNER_RADIUS
        contentView.layer.masksToBounds = false
        contentView.layer.rasterizationScale = UIScreen.main.scale
        contentView.layer.shouldRasterize = true
    }
}
