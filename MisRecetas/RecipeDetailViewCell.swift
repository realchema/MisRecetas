//
//  RecipeDetailViewCell.swift
//  MisRecetas
//
//  Created by Jose M Arguinzzones on 2019-01-18.
//  Copyright © 2019 Jose M Arguinzzones. All rights reserved.
//

import UIKit

class RecipeDetailViewCell: UITableViewCell {

    @IBOutlet var keyLabel: UILabel!
    
    @IBOutlet var valueLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
