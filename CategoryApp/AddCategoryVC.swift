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
        if txtEnglish.text != "" && txtHindi.text != "" {
            
        }
        self.navigationController?.popViewController(animated: true)
    }
    
}

//MARK: - Text Field Delegate Methods
extension AddCategoryVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        txtHindi.resignFirstResponder()
        txtEnglish.resignFirstResponder()
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        txtHindi.layer.borderWidth = 0
        txtEnglish.layer.borderWidth = 0
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
