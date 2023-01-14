//
//  LogoTitleView.swift
//  LearningTask-13.1
//
//  Created by rafael.rollo on 15/06/2022.
//

import UIKit

class LogoTitleView: UIStackView {
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 171, height: 44)
    }
    
    private lazy var logoImageView: UIImageView = {
        let imageView = UIImageView(image: .init(named: "Logo"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.tintColor = .white
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "bilhetes.com"
        label.font = UIFont(name: "Copperplate", size: 20)
        return label
    }()
    
    private override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        addTheme()
        addViews()
        addConstraints()
    }
    
    private func addTheme() {
        axis = .horizontal
        distribution = .fill
        alignment = .center
        spacing = 8
    }
    
    private func addViews() {
        addArrangedSubview(logoImageView)
        addArrangedSubview(titleLabel)
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            logoImageView.widthAnchor.constraint(equalToConstant: 32),
            logoImageView.heightAnchor.constraint(equalToConstant: 32),
        ])
    }
    
}


