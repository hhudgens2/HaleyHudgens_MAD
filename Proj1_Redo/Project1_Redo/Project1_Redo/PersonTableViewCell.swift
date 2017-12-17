//
//  PersonTableViewCell.swift
//  Project1_Redo
//
//  Created by Haley  Hudgens  on 12/8/17.
//  Copyright © 2017 HaleyHudgens. All rights reserved.
//

import UIKit

class PersonTableViewCell: UITableViewCell {

    @IBOutlet weak var personName: UILabel!
    @IBOutlet weak var meetDate: UILabel!
    
    
    
    @IBOutlet weak var cellBackground: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        cellBackground.layer.cornerRadius = 15.0
        cellBackground.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
