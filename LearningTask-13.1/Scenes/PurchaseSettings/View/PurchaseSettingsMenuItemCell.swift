//
//  PurchaseSettingsMenuItemCell.swift
//  LearningTask-13.1
//
//  Created by rafael.rollo on 19/07/2022.
//

import UIKit

class PurchaseSettingsMenuItemCell: UITableViewCell {

    // MARK: - Subviews
    private lazy var indicatorView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .tertiaryLabel
        view.constrainSize(to: .init(width: 4, height: 64))
        return view
    }()
    
    private lazy var primaryIconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .tertiaryLabel
        imageView.constrainSize(to: .init(width: 24, height: 24))
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .tertiaryLabel
        label.font = .systemFont(ofSize: 16)
        label.setContentHuggingPriority(.defaultLow, for: .horizontal)
        return label
    }()
    
    private lazy var navigationIconImageView: UIImageView = {
        let imageView = UIImageView(image: .init(named: "Forward Arrow"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .tertiaryLabel
        imageView.constrainSize(to: .init(width: 24, height: 24))
        return imageView
    }()
    
    private lazy var contentContainerStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            indicatorView, primaryIconImageView, titleLabel, navigationIconImageView
        ])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.spacing = 12
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = .init(top: 0, left: 0, bottom: 0, right: 12)
        stackView.backgroundColor = .tertiarySystemBackground
        return stackView
    }()
    
    private lazy var containerStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            contentContainerStackView,
        ])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = .init(top: 4, left: 0, bottom: 0, right: 0)
        return stackView
    }()
    
    // MARK: - Properties
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
    
    // MARK: - Lifecycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func tint(with color: UIColor) {
        indicatorView.backgroundColor = color
        primaryIconImageView.tintColor = color
        titleLabel.textColor = color
        navigationIconImageView.tintColor = color
    }
}

extension PurchaseSettingsMenuItemCell: ReusableView {}

extension PurchaseSettingsMenuItemCell: ViewCode {
    
    func customizeAppearance() {
        selectionStyle = .none
    }
    
    func addSubviews() {
        addSubview(containerStackView)
    }
    
    func addLayoutConstraints() {
        containerStackView.constrainTo(edgesOf: self)
    }
}
