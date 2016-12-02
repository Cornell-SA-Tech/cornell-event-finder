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
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        setRowHeight()
    }
    
    /**
     Sets the height of all cells in this table view
    */
    private func setRowHeight()
    {
        let totalHeight = tableView.frame.height
        tableView.rowHeight = totalHeight / 3
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
        //NOTE TO VINCE: open the new VC from here with performSegue stuff
        return true
    }
}
