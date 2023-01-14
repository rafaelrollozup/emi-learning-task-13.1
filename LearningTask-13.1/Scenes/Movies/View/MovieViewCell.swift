//
//  MovieViewCell.swift
//  LearningTask-13.1
//
//  Created by rafael.rollo on 13/06/2022.
//

import UIKit

class MovieViewCell: UICollectionViewCell {
    
    private lazy var posterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .secondarySystemBackground
        imageView.constrainHeightProportionally(byApplying: 40/27)
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .secondaryLabel
        label.font = .systemFont(ofSize: 14, weight: .light)
        label.textAlignment = .center
        label.numberOfLines = 2
        return label
    }()
    
    private lazy var containerStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [
            posterImageView,
            titleLabel
        ])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.alignment = .fill
        stack.distribution = .fill
        return stack
    }()
    
    private var firstRender: Bool = true
    
    var movie: Movie? {
        didSet {
            guard let movie = movie else {
                return
            }
            
            posterImageView.setImageByDowloading(url: movie.posterImageURI, animated: firstRender)
            titleLabel.text = movie.title
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
    
        let size = contentView.systemLayoutSizeFitting(layoutAttributes.size)
        layoutAttributes.frame.size.height = size.height
        
        setNeedsLayout()
        return layoutAttributes
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        firstRender = false
    }

}

extension MovieViewCell: ReusableView {}

extension MovieViewCell: ViewCode {
    
    func addSubviews() {
        addSubview(containerStackView)
    }
    
    func addLayoutConstraints() {
        containerStackView.constrainTo(edgesOf: self)
    }
    
}
