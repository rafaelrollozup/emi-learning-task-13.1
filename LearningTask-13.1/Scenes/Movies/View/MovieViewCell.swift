//
//  MovieViewCell.swift
//  LearningTask-13.1
//
//  Created by rafael.rollo on 13/06/2022.
//

import UIKit

class MovieViewCell: UICollectionViewCell {
    @IBOutlet private weak var posterImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
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
