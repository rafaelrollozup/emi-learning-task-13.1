//
//  TableSectionHeaderView.swift
//  LearningTask-13.1
//
//  Created by rafael.rollo on 10/06/2022.
//

import UIKit

class SessionsTableSectionHeaderView: UITableViewHeaderFooterView {
    
    static var reuseId: String {
        return String(describing: self)
    }
    
    static var heightConstant: CGFloat { return 48 }
    
    private lazy var iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = .init(named: "Heart")
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .tertiaryLabel
        
        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalToConstant: 20),
            imageView.heightAnchor.constraint(equalToConstant: 20),
        ])
        
        return imageView
    }()
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .tertiaryLabel
        label.font = .systemFont(ofSize: 16, weight: .light)
        return label
    }()
    
    private lazy var containerStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [
            iconImageView, label
        ])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.alignment = .center
        stack.distribution = .fill
        stack.spacing = 8
        stack.isLayoutMarginsRelativeArrangement = true
        stack.layoutMargins = UIEdgeInsets(top: 0, left: 24, bottom: 0, right: 24)
        return stack
    }()
    
    var cinema: Cinema? {
        didSet {
            guard let cinema = cinema else { return }
            label.text = cinema.name
        }
    }
        
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}

extension SessionsTableSectionHeaderView: ViewCode {
    
    func addSubviews() {
        addSubview(containerStackView)
    }
    
    func addLayoutConstraints() {
        self.constrainHeight(to: Self.heightConstant)
        containerStackView.constrainTo(edgesOf: self)
    }
    
}
