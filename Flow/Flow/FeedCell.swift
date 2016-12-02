//
//  FeedCell.swift
//  Flow
//
//  Created by David Chu on 2016/12/2.
//  Copyright © 2016年 SA Tech. All rights reserved.
//

import UIKit

class FeedCell:UITableViewCell
{
    @IBOutlet weak private var eventImage: UIImageView!
    @IBOutlet weak private var eventTitle: UILabel!
    @IBOutlet weak private var eventCaption: UILabel!
    @IBOutlet weak private var eventDate: UILabel!
    
    func configure(title:String, caption:String, date:String)
    {
        eventTitle.text = title
        eventCaption.text = caption
        eventDate.text = date
    }
}
