//
//  CategoryDetailVC.swift
//  CategoryApp
//
//  Created by Vishnu on 23/03/22.
//

import UIKit

class CategoryDetailVC: UIViewController {
    
    @IBOutlet weak var lblCategoryTitle: UILabel!
    @IBOutlet weak var lblDescriptn: UILabel!
    var selectedCategory: Datum?
    var titleText:String?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = titleText
        // Do any additional setup after loading the view.
        lblCategoryTitle.text = selectedCategory?.slug.capitalized
        lblDescriptn.text = selectedCategory?.datumDescription
        
    }
    

    override open var shouldAutorotate: Bool {
        return false
    }

}
