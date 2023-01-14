//
//  MoviePosterImageView.swift
//  LearningTask-13.1
//
//  Created by rafael.rollo on 15/06/2022.
//

import UIKit

class MoviePosterImageView: UIImageView {

    private static let heightConstant: CGFloat = 150
    
    var shadow: Bool = false
    
    convenience init(byDownloading imageURL: URL) {
        self.init(frame: .zero)
        self.setImageByDowloading(url: imageURL, animated: true)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        guard shadow else { return }

        let posterRect = CGRect(origin: .zero, size: size)
        
        layer.shadowPath = UIBezierPath(rect: posterRect).cgPath
        layer.shadowRadius = 16.0
        layer.shadowOpacity = 1
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: -1)
    }
}

extension MoviePosterImageView: ViewCode {
    
    fileprivate static let aspectRatio: Double = 27 / 40
    
    var size: CGSize {
        return CGSize(width: Self.heightConstant * Self.aspectRatio,
                      height: Self.heightConstant)
    }

    func customizeAppearance() {
        contentMode = .scaleAspectFill
    }

    func addLayoutConstraints() {
        self.constrainSize(to: size)
    }
    
}
