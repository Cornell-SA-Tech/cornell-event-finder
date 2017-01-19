//
//  FeedVC.swift
//  Flow
//
//  Created by David Chu on 2016/12/2.
//  Copyright © 2016年 SA Tech. All rights reserved.
//

import UIKit

class FeedVC:UITableViewController, UISearchBarDelegate
{
    @IBOutlet weak var searchBar: UISearchBar!
    let data = [["Hello", "World", "2/12"],
                ["Chance the Rapper: All Night Concert", "3904 Jabari Shoal Suite 087, Happy City, New York", "12/31"],
                ["Dinner", "Appel", "Today"]]
    let feedOptions = ["Trending", "Nightlife", "Health & Fitness", "Concerts & Shows", "Art & Culture", "Philanthropy", "Food", "Education"]
    var titleButton: UIButton!
    var feedOptionButtons: [UIButton]!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        setRowHeight()
        initNavBarOverlay()
        initFeedOptionButtons()
    }
    
    /**
     Sets the height of all cells in this table view
    */
    private func setRowHeight()
    {
        let totalHeight = tableView.frame.height
        tableView.rowHeight = totalHeight / 3
    }
    /**
     Turns the navigation bar into a button.
     */
    private func initNavBarOverlay()
    {
        titleButton = UIButton(type: .system)
        setNavBarTitle(feedOptions[0])
        titleButton.setTitleColor(UIColor.black, for: .normal)
        titleButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        titleButton.addTarget(self, action: #selector(onNavBarClick), for: .touchUpInside)
        navigationItem.titleView = titleButton
    }
    func onNavBarClick()
    {
        animateFeedOptionButtons()
    }
    /**
     Takes a desired navigation bar title and appends the downward arrow.
     */
    private func setNavBarTitle(_ title:String)
    {
        titleButton.setTitle("\(title) ▼", for: .normal)
        titleButton.sizeToFit()
    }
    /**
     Creates all the feed option buttons, setting their constraints and text. The buttons are then turned invisible.
     */
    private func initFeedOptionButtons()
    {
        feedOptionButtons = [UIButton]()
        for i in 0..<feedOptions.count
        {
            let button = UIButton(type: .system)
            button.translatesAutoresizingMaskIntoConstraints = false
            button.setTitle(feedOptions[i], for: .normal)
            button.addTarget(self, action: #selector(onFeedOptionButtonClick), for: .touchUpInside)
            feedOptionButtons.append(button)
            
            view.addSubview(button)
            if (i == 0)
            {
                view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[view]-16-[button]", options: .alignAllCenterX, metrics: nil, views: ["view":view, "button":button]))
            }
            else
            {
                view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[previousButton]-16-[button]", options: .alignAllCenterX, metrics: nil, views: ["previousButton":feedOptionButtons[i - 1], "button":button]))
            }
            button.alpha = 0.0
        }
    }
    /**
     Animate feed option buttons either appearing or fading. If appearing, start appearing from the top. If fading, start fading from the bottom. The buttons will fade if they are currently showing; they'll appear if they're currently faded.
     
     Fading will not begin unless all the buttons are either present or not present (an animation is NOT occurring).
     */
    private func animateFeedOptionButtons()
    {
        let lastButtonAlpha = feedOptionButtons[feedOptionButtons.count - 1].alpha
        let firstButtonAlpha = feedOptionButtons[0].alpha
        /*
         Cases:
         1. We have finished making all buttons appear. The last button to appear is the last button, so if the last button has alpha = 1.0, then all buttons have appeared.
         2. We have finished making all buttons disappear. The last button to disappear is the first button, so if the first button has alpha = 0.0, then all buttons have disappeared.
         */
        guard lastButtonAlpha == 1.0 || firstButtonAlpha == 0.0 else {
            return
        }
        
        let fade = lastButtonAlpha == 1.0
        if (fade)
        {
            for i in 1...feedOptionButtons.count
            {
                UIView.animate(withDuration: 0.05, delay: Double(i) * 0.05, options: .curveLinear, animations: {self.feedOptionButtons[self.feedOptionButtons.count - i].alpha = 0.0}, completion: nil)
            }
        }
        else
        {
            for i in 0..<feedOptionButtons.count
            {
                UIView.animate(withDuration: 0.05, delay: Double(i) * 0.05, options: .curveLinear, animations: {self.feedOptionButtons[i].alpha = 1.0}, completion: nil)
            } 
        }
    }
    /**
     When a feed option button is clicked, change the current title of the navigation bar and hide all the feed options.
     */
    func onFeedOptionButtonClick(_ button:UIButton)
    {
        guard let title = button.currentTitle else {
            return
        }
        animateFeedOptionButtons()
        setNavBarTitle(title)
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return data.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "feedCell", for: indexPath) as! FeedCell
        let dataForCell = data[indexPath.row]
        cell.configure(title: dataForCell[0], caption: dataForCell[1], date: dataForCell[2])
        return cell
    }
    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool
    {
        performSegue(withIdentifier: "showSearchView", sender: self)
        return true
    }
}
