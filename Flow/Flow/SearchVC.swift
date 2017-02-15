import UIKit

class SearchVC:UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UISearchBarDelegate
{
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var collectionView: UICollectionView!
    
    let data = ["Music", "Art", "Food", "Entertainment", "Education", "Career", "Sale", "Party"]
    var categoryContainer:CategoryContainer?
    
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
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        let width = (view.frame.width - (Metrics.margin.rawValue * 3)) / 2
        return CGSize(width: width, height: width)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        let category = data[indexPath.row]
        categoryContainer?.searchFor(category)
        unwindSegue()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar)
    {
        unwindSegue()
    }
    
    private func unwindSegue()
    {
        navigationController?.navigationBar.isHidden = false
        navigationController?.popViewController(animated: false)
    }
}
