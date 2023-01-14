//
//  SessionViewCell.swift
//  LearningTask-13.1
//
//  Created by rafael.rollo on 10/06/2022.
//

import UIKit

class SessionViewCell: UITableViewCell {

    @IBOutlet weak var hoursLabel: UILabel!
    @IBOutlet weak var sessionTypeLabel: UILabel!
    
    var movieSession: Session? {
        didSet {
            guard let movieSession = movieSession else { return }

            hoursLabel.text = DateFormatter.format(date: movieSession.dateTime,
                                                   to: .hoursPlusMinutes)
            sessionTypeLabel.text = movieSession.type.rawValue
        }
    }
    
}
