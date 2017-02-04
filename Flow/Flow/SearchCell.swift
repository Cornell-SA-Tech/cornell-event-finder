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
    
    func configure(category:String)
    {
        self.category.text = category
    }
}
