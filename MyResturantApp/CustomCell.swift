//
//  CustomCell.swift
//  MyResturantApp
//
//  Created by Zachary Aguon on 2/13/17.
//  Copyright © 2017 Zachary Aguon. All rights reserved.
//

import UIKit
import Firebase

class CustomCell: UITableViewCell {

    @IBOutlet var Photo: UIImageView!
    @IBOutlet var name: UILabel!
    @IBOutlet var Description: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
