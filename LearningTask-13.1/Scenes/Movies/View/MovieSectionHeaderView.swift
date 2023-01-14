//
//  MovieSectionHeaderView.swift
//  LearningTask-13.1
//
//  Created by rafael.rollo on 13/06/2022.
//

import UIKit

class MovieSectionHeaderView: UICollectionReusableView {
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .secondaryLabel
        label.font = .systemFont(ofSize: 18, weight: .light)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var title: String? {
        didSet {
            titleLabel.text = title
        }
    }
}

extension MovieSectionHeaderView: ReusableView {}

extension MovieSectionHeaderView: ViewCode {
    
    func customizeAppearance() {
        backgroundColor = .secondarySystemBackground
    }
    
    func addSubviews() {
        addSubview(titleLabel)
    }
    
    func addLayoutConstraints() {
        titleLabel.constrainHorizontally(to: self, withMargins: 20)
        titleLabel.anchorToCenterY(of: self)
    }
    
}
