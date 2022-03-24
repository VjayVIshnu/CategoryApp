//
//  SubcategoryVC.swift
//  CategoryApp
//
//  Created by Vishnu on 24/03/22.
//

import UIKit

class SubcategoryVC: UIViewController,UITableViewDataSource,UITableViewDelegate {

    

    @IBOutlet weak var tblSubCategoryVC: UITableView!
    var selectedSubCategory:[Datum] = []
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return selectedSubCategory.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ReuseIdentifiers.Cells.subcategoryCell, for: indexPath) as! SubcategoryCell
        cell.lblTitle.text = selectedSubCategory[indexPath.row].name[0].value
        cell.lblDescriptn.text = selectedSubCategory[indexPath.row].datumDescription
        cell.selectedCategory = selectedSubCategory[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

}
