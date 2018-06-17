//
//  CourtsTableViewCell.swift
//  tennispoints
//
//  Created by CRBeasley on 6/16/18.
//  Copyright © 2018 TennisIQ. All rights reserved.
//

import UIKit

class CourtsTableViewCell: UITableViewCell {

    @IBOutlet weak var courtName: UILabel!
    @IBOutlet weak var location: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
