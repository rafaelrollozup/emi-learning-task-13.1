//
//  MovieRatingView.swift
//  LearningTask-13.1
//
//

import UIKit

class MovieRatingView: UILabel {
    // MARK: - Configuration support
    
    private var color: UIColor {
        switch movieRating {
        case .free:
            return .systemGreen
        case .notRecommendedUnder10:
            return .systemBlue
        case .notRecommendedUnder12:
            return .systemYellow
        case .notRecommendedUnder14:
            return .systemOrange
        case .notRecommendedUnder16:
            return .systemRed
        case .notRecommendedUnder18:
            return .black
        case .none:
            return .secondaryLabel
        }
    }
    // MARK: - Properties

    var movieRating: MovieRating? {
        didSet {
            guard let movieRating = movieRating else { return }

            backgroundColor = color
            text = movieRating.rawValue
        }
    }
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init(coder: NSCoder) {
        fatalError()
    }
    
}

extension MovieRatingView: ViewCode {
    
    var size: CGSize {
        return CGSize(width: 20, height: 20)
    }
    
    func customizeAppearance() {
        backgroundColor = .secondaryLabel
        textColor = .white
        font = .systemFont(ofSize: 12, weight: .bold)
        textAlignment = .center
        
        layer.masksToBounds = true
        layer.cornerRadius = 4
    }
    
    func addLayoutConstraints() {
        self.constrainSize(to: size)
    }
    
}

