//
//  FeedVC.swift
//  Flow
//
//  Created by David Chu on 2016/12/2.
//  Copyright © 2016年 SA Tech. All rights reserved.
//

import UIKit

class FeedVC:UITableViewController, UISearchBarDelegate, CategoryContainer
{
    @IBOutlet weak var searchNavBarItem: UIBarButtonItem!
    let data = [["Hello", "World", "2/12"],
                ["Chance the Rapper: All Night Concert", "3904 Jabari Shoal Suite 087, Happy City, New York", "12/31"],
                ["Dinner", "Appel", "Today"]]
    let SEARCH_PLACEHOLDER = "search in category"
    var searchBar:UISearchBar?
    var categoryLabel:UILabel?
    var headerView:UIView?
    
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
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if (segue.identifier == "searchSegue")
        {
            let searchVC = segue.destination as! SearchVC
            searchVC.categoryContainer = self
        }
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar)
    {
        searchBar.resignFirstResponder()
    }
    func searchFor(_ category: String)
    {
        searchNavBarItem.isEnabled = false
        searchNavBarItem.tintColor = UIColor.clear
        
        guard headerView == nil else {
            setCategoryLabelText(category)
            tableView.tableHeaderView = headerView
            return
        }
        
        headerView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 64))
        initCategoryLabel()
        setCategoryLabelText(category)
        initSearchBar()
        layoutSearchContraints()
        tableView.tableHeaderView = headerView
    }
    func onCategoryLabelClick(_ sender:UITapGestureRecognizer)
    {
        searchNavBarItem.isEnabled = true
        searchNavBarItem.tintColor = UIColor.black
        
        tableView.tableHeaderView = nil
    }
    private func initCategoryLabel()
    {
        categoryLabel = UILabel()
        
        //bg with rounded corners
        categoryLabel?.layer.backgroundColor = UIColor.orange.cgColor
        categoryLabel?.layer.cornerRadius = 5
        categoryLabel?.layer.masksToBounds = false
        categoryLabel?.layer.rasterizationScale = UIScreen.main.scale
        categoryLabel?.layer.shouldRasterize = true
        //click event
        categoryLabel?.isUserInteractionEnabled = true
        categoryLabel?.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(onCategoryLabelClick)))
        
        categoryLabel?.translatesAutoresizingMaskIntoConstraints = false
        headerView?.addSubview(categoryLabel!)
    }
    private func setCategoryLabelText(_ text:String)
    {
        categoryLabel?.text = "  \(text)  "   //add spaces for padding
    }
    private func initSearchBar()
    {
        searchBar = UISearchBar()
        searchBar?.searchBarStyle = .minimal
        searchBar?.placeholder = SEARCH_PLACEHOLDER
        searchBar?.showsCancelButton = true
        searchBar?.delegate = self
        searchBar?.translatesAutoresizingMaskIntoConstraints = false
        headerView?.addSubview(searchBar!)
    }
    private func layoutSearchContraints()
    {
        let horizConstraint = NSLayoutConstraint.constraints(withVisualFormat: "H:|-(halfMargin)-[categoryLabel]-(halfMargin)-[searchBar]-0-|", options: .alignAllCenterY, metrics: ["halfMargin":Metrics.halfMargin.rawValue], views: ["categoryLabel":categoryLabel!, "searchBar":searchBar!])
        headerView?.addConstraints(horizConstraint)
    }
}
protocol CategoryContainer
{
    func searchFor(_ category:String) -> ()
}
