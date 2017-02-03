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
    
    @IBOutlet weak var searchNavBarItem: UIBarButtonItem!
    let data = [["Hello", "World", "2/12"],
                ["Chance the Rapper: All Night Concert", "3904 Jabari Shoal Suite 087, Happy City, New York", "12/31"],
                ["Dinner", "Appel", "Today"]]
    let SEARCH_PLACEHOLDER = "search events"
    var searchBar:UISearchBar?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        setRowHeight()
        setTitleFont()
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
     Sets the font of the navigation bar title
     */
    private func setTitleFont()
    {
        navigationController?.navigationBar.titleTextAttributes = [NSFontAttributeName:UIFont.init(name: "Copperplate", size: 32)!]
    }

    @IBAction func onSearchClicked(_ sender: UIBarButtonItem)
    {
        sender.isEnabled = false
        sender.tintColor = UIColor.clear
        
        guard searchBar == nil else {
            tableView.tableHeaderView = searchBar
            return
        }
        searchBar = UISearchBar(frame: CGRect(x: 0, y: 0, width: 320, height: 44))
        searchBar?.searchBarStyle = .minimal
        searchBar?.placeholder = SEARCH_PLACEHOLDER
        searchBar?.showsCancelButton = true
        searchBar?.delegate = self
        tableView.tableHeaderView = searchBar
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
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar)
    {
        searchNavBarItem.isEnabled = true
        searchNavBarItem.tintColor = UIColor.black
        tableView.tableHeaderView = nil
    }
}
