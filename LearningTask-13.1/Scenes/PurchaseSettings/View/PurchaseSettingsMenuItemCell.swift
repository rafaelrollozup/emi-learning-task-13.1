//
//  PurchaseSettingsMenuItemCell.swift
//  LearningTask-13.1
//
//  Created by rafael.rollo on 19/07/2022.
//

import UIKit

class PurchaseSettingsMenuItemCell: UITableViewCell {

    @IBOutlet private weak var indicatorView: UIView!
    @IBOutlet private weak var primaryIconImageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var navigationIconImageView: UIImageView!
    
    private let activeColor: UIColor = .systemOrange
    private let baseColor: UIColor = .tertiaryLabel
    
    private var icon: UIImage? {
        switch menuItem {
        case .seatChoices:
            return UIImage(named: "Chair")
        case .ticketTypes:
            return UIImage(named: "Ticket")
        case .snacks:
            return UIImage(named: "Popcorn")
        case .paymentMethod:
            return UIImage(named: "Card")
        case .none:
            return nil
        }
    }
    
    var menuItem: MenuItem? {
        didSet {
            guard let menuItem = menuItem else { return }

            primaryIconImageView.image = icon
            titleLabel.text = menuItem.rawValue.uppercased()
        }
    }
    
    var active: Bool = false {
        didSet {
            let color = active ? activeColor : baseColor
            tint(with: color)
        }
    }
    
    private func tint(with color: UIColor) {
        indicatorView.backgroundColor = color
        primaryIconImageView.tintColor = color
        titleLabel.textColor = color
        navigationIconImageView.tintColor = color
    }
}
