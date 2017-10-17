//
//  ArtworkItemTableViewCell.swift
//  artPub
//
//  Created by Haley  Hudgens  on 10/4/17.
//  Copyright © 2017 HaleyHudgens. All rights reserved.
//

import UIKit

class ArtworkItemTableViewCell: UITableViewCell {
    // outlets
    @IBOutlet weak var itemNameLabel: UILabel!
    
    // data
    var itemName: String!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureWithItem(item: String) {
        self.itemName = item
        self.itemNameLabel?.text = item
    }
}
