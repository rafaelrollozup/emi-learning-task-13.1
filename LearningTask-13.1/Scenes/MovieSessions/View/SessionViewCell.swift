//
//  SessionViewCell.swift
//  LearningTask-13.1
//
//  Created by rafael.rollo on 10/06/2022.
//

import UIKit

class SessionViewCell: UITableViewCell {

    private lazy var filmIconImageView: UIImageView = {
        let imageView = UIImageView(image: .init(named: "Film"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .secondaryLabel
        imageView.constrainSize(to: .init(width: 24, height: 24))
        return imageView
    }()
    
    private lazy var hoursLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .secondaryLabel
        label.font = .systemFont(ofSize: 14, weight: .semibold)
        label.setContentHuggingPriority(.defaultLow, for: .horizontal)
        return label
    }()
    
    private lazy var sessionTypeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .secondaryLabel
        label.font = .italicSystemFont(ofSize: 14)
        return label
    }()
    
    private lazy var containerStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            filmIconImageView, hoursLabel, sessionTypeLabel
        ])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.spacing = 12
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = UIEdgeInsets(top: 12, left: 12, bottom: 12, right: 12)
        return stackView
    }()
    
    var movieSession: Session? {
        didSet {
            guard let movieSession = movieSession else { return }

            hoursLabel.text = DateFormatter.format(date: movieSession.dateTime,
                                                   to: .hoursPlusMinutes)
            sessionTypeLabel.text = movieSession.type.rawValue
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension SessionViewCell: ReusableView {}

extension SessionViewCell: ViewCode {
    
    func customizeAppearance() {
        backgroundColor = .secondarySystemBackground
    }
    
    func addSubviews() {
        addSubview(containerStackView)
    }
    
    func addLayoutConstraints() {
        containerStackView.constrainTo(edgesOf: self)
    }
}
