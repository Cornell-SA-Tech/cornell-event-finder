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
    @IBOutlet weak var container: UIView!
    @IBOutlet weak private var eventImage: UIImageView!
    @IBOutlet weak private var eventTitle: UILabel!
    @IBOutlet weak private var eventCaption: UILabel!
    @IBOutlet weak private var eventDate: UILabel!
    
    override func awakeFromNib()
    {
        //roundCorners()
    }
    private func roundCorners()
    {
        let maskPath = UIBezierPath(roundedRect: container.bounds, byRoundingCorners: .allCorners, cornerRadii: CGSize(width: 10.0, height: 10.0))
        let maskLayer = CAShapeLayer(layer: maskPath)
        maskLayer.frame = container.bounds
        maskLayer.path = maskPath.cgPath
        container.layer.mask = maskLayer
    }
    func configure(title:String, caption:String, date:String)
    {
        eventTitle.text = title
        eventCaption.text = caption
        eventDate.text = date
    }
}
