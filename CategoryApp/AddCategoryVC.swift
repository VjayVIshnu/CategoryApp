//
//  AddCategoryVC.swift
//  CategoryApp
//
//  Created by Vishnu on 23/03/22.
//

import UIKit

class AddCategoryVC: UIViewController {

    @IBOutlet weak var txtHindi: UITextField!
    @IBOutlet weak var txtEnglish: UITextField!
    @IBOutlet weak var btnNonFeatured: RadioButton!
    @IBOutlet weak var btnFeatured: RadioButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    

    @IBAction func btnTappedSave(_ sender: Any) {

        self.navigationController?.popViewController(animated: true)
    }
    
    
    
}
