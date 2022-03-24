//
//  AppConstants.swift
//  CategoryApp
//
//  Created by Vishnu on 23/03/22.
//

import Foundation

// MARK: - Reuse Identifiers -

/// Defines the reuse identifiers
struct ReuseIdentifiers {
    
    /// Defines the reuse identifiers of the ViewControllers
    struct ViewControllers {
        
    }
    
    /// Defines the reuse identifiers of the Cells
    struct Cells {
        static let expandableTableViewCell  = "ExpandableTableViewCell"
        static let subcategoryCell          = "SubcategoryCell"
    }
    
    /// Defines the reuse identifiers of the Segues
    struct Segues {
        static let categoryDetailSegue      = "CategoryDetailSegue"
        static let segueToSubCategories     = "segueToSubCategories"
    }
}
