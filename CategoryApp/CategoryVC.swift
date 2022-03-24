//
//  CategoryVC.swift
//  CategoryApp
//
//  Created by Vishnu on 23/03/22.
//

import UIKit

class CategoryVC: UIViewController,UISearchBarDelegate {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tblCategoryList: UITableView!
    var response: Welcome?
    var mainCategoryList:[Datum] = []
    var selectedCategory:Datum?
    var selectedSubCategory: [Datum] = []
    var selectedIndex:Int?
    var filtered:[Datum] = []
    var searchActive : Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadJsonData()
        // Do any additional setup after loading the view.
        searchBar.showsCancelButton = false
        searchBar.layoutIfNeeded()
        tblCategoryList.estimatedRowHeight = 100
        tblCategoryList.rowHeight = UITableView.automaticDimension

    }
    
    override func viewDidAppear(_ animated: Bool) {
        searchBar.resignFirstResponder()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == ReuseIdentifiers.Segues.categoryDetailSegue {
            if let destinationVC = segue.destination as? CategoryDetailVC {
                destinationVC.selectedCategory = selectedCategory
            }
        } else if segue.identifier == ReuseIdentifiers.Segues.segueToSubCategories {
            if let destinationVC = segue.destination as? SubcategoryVC {
                destinationVC.selectedSubCategory = selectedSubCategory
            }
        }
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
            searchActive = true;
        }

    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
            searchActive = false;
        }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
            searchActive = false;
        }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
            searchActive = false;
        }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {

            filtered = mainCategoryList.filter({ (text) -> Bool in
                let tmp: NSString = text.datumDescription as NSString
                let range = tmp.range(of: searchText, options: NSString.CompareOptions.caseInsensitive)
                return range.location != NSNotFound
            })
            if(filtered.count == 0){
                searchActive = false;
            } else {
                searchActive = true;
            }
            self.tblCategoryList.reloadData()
        }
    
    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
        // Stop doing the search stuff
        // and clear the text in the search bar
        searchBar.text = ""
        searchActive = false
        filtered = []
        // Hide the cancel button
        searchBar.showsCancelButton = false
        // You could also change the position, frame etc of the searchBar
    }

    func loadJsonData() {
        guard let url = Bundle.main.url(forResource: "TestCategoryData", withExtension: "json") else {
            return
        }
        
        do {
            let data = try Data(contentsOf: url)
            guard let categoryList = try? JSONDecoder().decode(Welcome.self, from: data) else {
                return
            }
            response = categoryList
            response?.data.map {
                let newItem = $0
                if $0.parentID == "0" {
                    var subcategoriesList:[Datum] = []
                    response?.data.map {
                        if $0.parentID == newItem.categoryID {
                          subcategoriesList.append($0)
                        }
                  }
                    var tempCategory = $0
                    tempCategory.subCategory = subcategoriesList
                    mainCategoryList.append(tempCategory)
                }
            }
        } catch {
            
        }
        
    }
}



// MARK: - TableView datasoure methods

extension CategoryVC : UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        switch section {
//        case 0:
//            return mainCategoryList.count
//        case 1:
//            return mainCategoryList[section].subCategory!.count
//        default:
//            return 0
//        }
//    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(searchActive) {
            return filtered.count
        } else {
            return mainCategoryList.count
        }
        
    }
    

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ReuseIdentifiers.Cells.expandableTableViewCell, for: indexPath) as! ExpandableTableViewCell
        if searchActive {
            cell.categoryTitleLabel.text = filtered[indexPath.row].slug.capitalized
            cell.selectedCategory = filtered[indexPath.row]
            cell.delegate = self
            return cell
        } else {
            cell.categoryTitleLabel.text = mainCategoryList[indexPath.row].name[0].value
            cell.selectedCategory = mainCategoryList[indexPath.row]
            cell.delegate = self
            return cell
        }
            
            
            

        
    }
    
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

   



}

// MARK: - TableView Delegate methods

extension CategoryVC : UITableViewDelegate, moveToSubcategoryDelegate {

    
    func moveToSubcategory(selectedCategory: Datum) {
        self.selectedCategory = selectedCategory
        self.performSegue(withIdentifier: ReuseIdentifiers.Segues.categoryDetailSegue, sender: selectedCategory)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedSubCategory = mainCategoryList[indexPath.row].subCategory!
        self.performSegue(withIdentifier: ReuseIdentifiers.Segues.segueToSubCategories, sender: selectedSubCategory)
    }
}
