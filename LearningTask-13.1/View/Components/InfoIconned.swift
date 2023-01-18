//
//  Session.swift
//  LearningTask-13.1
//
//  Created by rafael.rollo on 14/01/2023.
//

import UIKit

class InfoIconned: UIView {
    
    private lazy var iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.tintColor = .secondaryLabel
        imageView.constrainSize(to: .init(width: 20, height: 20))
        return imageView
    }()
    
    private lazy var textLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 14, weight: .light)
        label.textColor = .secondaryLabel
        return label
    }()
    
    private lazy var contentView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            iconImageView, textLabel
        ])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.alignment = .center
        stackView.spacing = 8
        return stackView
    }()
    
    var icon: UIImage? {
        didSet {
            iconImageView.image = icon
        }
    }
    
    var text: String? {
        didSet {
            textLabel.text = text
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension InfoIconned: ViewCode {
    
    func addSubviews() {
        addSubview(contentView)
    }
    
    func addLayoutConstraints() {
        contentView.constrainTo(edgesOf: self)
    }
    
}
