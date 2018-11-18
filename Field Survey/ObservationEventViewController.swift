//
//  ObservationEventViewController.swift
//  Field Survey
//
//  Created by Sam on 11/16/18.
//  Copyright © 2018 Sam. All rights reserved.
//

import UIKit

class ObservationEventViewController: UIViewController, UIWebViewDelegate, UITableViewDataSource {
    var dateFormatter = DateFormatter()
    
    @IBOutlet weak var observationTableView: UITableView!
    
    let jsonFileName = "SurveyData"
    var observationEvents: ObservationEvents?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .medium
        
        observationEvents = ObservationCollectionLoader.load(jsonFileName: jsonFileName)
        
        if observationEvents == nil {
            presentMessage(message: "Unable to load and parse \(jsonFileName).json")
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return observationEvents?.events.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = observationTableView.dequeueReusableCell(withIdentifier: "observationEventCell", for: indexPath)
        
        if let cell = cell as? ObservationEventTableViewCell,
            let observationEvent = observationEvents?.events[indexPath.row] {
            cell.titleLabel.text = observationEvent.title
            cell.dateLabel.text = dateFormatter.string(from: observationEvent.date)
            cell.observationIconImageView.image = UIImage(named: observationEvent.classification.rawValue)
        }
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? ObservationEventDetailViewController,
            let selectedIndexPath = observationTableView.indexPathForSelectedRow {
            destination.observationEvent = observationEvents?.events[selectedIndexPath.row]
        }
    }
    
    func presentMessage(message: String) {
        let alertController = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
}
