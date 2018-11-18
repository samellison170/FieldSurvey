//
//  ObservationEventTableViewCell.swift
//  Field Survey
//
//  Created by Sam on 11/17/18.
//  Copyright © 2018 Sam. All rights reserved.
//

import UIKit

class ObservationEventTableViewCell: UITableViewCell {
    @IBOutlet weak var observationIconImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
