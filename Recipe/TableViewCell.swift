//
//  TableViewCell.swift
//  Recipe
//
//  Created by Eric on 2016-10-24.
//  Copyright © 2016 Eric. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBOutlet weak var name: UILabel!
    
    func setInternalField(text: String) {
        name.text = text
    }
}
