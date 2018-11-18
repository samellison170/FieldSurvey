//
//  ObservationEventDetailViewController.swift
//  Field Survey
//
//  Created by Sam on 11/16/18.
//  Copyright © 2018 Sam. All rights reserved.
//

import UIKit

class ObservationEventDetailViewController: UIViewController {
    
    @IBOutlet weak var imageIcon: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UITextView!
    
    
    
    let dateFormatter = DateFormatter()
    
    var observationEvent: ObservationEvent?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .medium
        
        if let observationEvent = observationEvent {
            titleLabel.text = observationEvent.title
            dateLabel.text = dateFormatter.string(from: observationEvent.date)
            imageIcon.image = UIImage(named: observationEvent.classification.rawValue)
        }
    }
}
