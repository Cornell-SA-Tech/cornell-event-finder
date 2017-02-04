import UIKit

class SearchVC:UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UISearchBarDelegate
{
    let data = ["Music", "Art", "Food", "Entertainment", "Education", "Career", "Sale", "Party"]
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "categoryCell", for: indexPath) as! SearchCell
        cell.configure(category: data[indexPath.row])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return data.count
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar)
    {
        navigationController?.popViewController(animated: true)
        navigationController?.navigationBar.isHidden = false
    }
}
