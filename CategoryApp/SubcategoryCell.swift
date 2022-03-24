//
//  SubcategoryCell.swift
//  CategoryApp
//
//  Created by Vishnu on 23/03/22.
//

import UIKit

class SubcategoryCell: UITableViewCell {
    
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDescriptn: UILabel!
    
    var selectedCategory:Datum?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        lblDescriptn.text = selectedCategory?.datumDescription
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
