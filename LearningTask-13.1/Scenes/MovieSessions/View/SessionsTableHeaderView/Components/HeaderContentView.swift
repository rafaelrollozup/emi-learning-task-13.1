//
//  HeaderContentView.swift
//  LearningTask-13.1
//
//

import UIKit

class HeaderContentView: UIView {
    // MARK: - Subviews

    private lazy var backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.setImageByDowloading(url: movie.bannerImageURI,
                                       animated: true)
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private lazy var posterImageView: MoviePosterImageView = {
        let imageView = MoviePosterImageView.init(byDownloading: movie.posterImageURI)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.shadow = true
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.numberOfLines = 3
        label.text = movie.title
        return label
    }()
    
    private lazy var shareButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(.init(named: "Share"), for: .normal)
        button.tintColor = .white
        button.constrainSize(to: .init(width: 24, height: 24))
        return button
    }()
    
    private lazy var playTrailerButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(.init(named: "Play"), for: .normal)
        button.tintColor = .white
        button.constrainSize(to: .init(width: 24, height: 24))
        return button
    }()
    
    private lazy var controlsStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.alignment = .center
        stack.distribution = .fill
        stack.spacing = 16
        
        stack.addArrangedSubview(shareButton)
        stack.addArrangedSubview(playTrailerButton)
        return stack
    }()
    
    private lazy var movieRatingView: MovieRatingView = {
        let view = MovieRatingView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.movieRating = movie.rating
        return view
    }()
    
    private lazy var movieDurationLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = .systemFont(ofSize: 10, weight: .regular)
        label.textAlignment = .center
        label.text = DateComponentsFormatter.format(timeInterval: movie.duration)
        return label
    }()
    
    private lazy var criticScoreView: MovieStatView = {
        let view = MovieStatView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.stat = .criticsScore
        view.score = movie.criticsScore
        return view
    }()
    
    private lazy var publicScoreView: MovieStatView = {
        let view = MovieStatView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.stat = .publicScore
        view.score = movie.publicScore
        return view
    }()
    
    private lazy var infoStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.alignment = .center
        stack.distribution = .fill
        stack.spacing = 8

        stack.addArrangedSubview(movieRatingView)
        stack.addArrangedSubview(movieDurationLabel)
        stack.addArrangedSubview(criticScoreView)
        stack.addArrangedSubview(publicScoreView)
        return stack
    }()
    
    private lazy var contentStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.alignment = .leading
        stack.distribution = .fill
        stack.spacing = 20
        stack.isLayoutMarginsRelativeArrangement = false
        stack.layoutMargins = UIEdgeInsets(top: 24, left: 24, bottom: 24, right: 24)
        
        stack.addArrangedSubview(titleLabel)
        stack.addArrangedSubview(controlsStackView)
        stack.addArrangedSubview(infoStackView)
        return stack
    }()
    
    private lazy var gradientLayer: CAGradientLayer = {
        let layer = CAGradientLayer()
        layer.colors = [
            UIColor.black.withAlphaComponent(0.2).cgColor,
            UIColor.black.withAlphaComponent(0.6).cgColor,
            UIColor.black.cgColor
        ]
        return layer
    }()
    
    private lazy var contentContainerStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.alignment = .bottom
        stack.distribution = .fill
        stack.spacing = 24
        stack.isLayoutMarginsRelativeArrangement = true
        stack.layoutMargins = UIEdgeInsets(top: 24, left: 32, bottom: 24, right: 32)
        
        stack.addArrangedSubview(posterImageView)
        stack.addArrangedSubview(contentStackView)
        
        stack.layer.insertSublayer(gradientLayer, below: posterImageView.layer)
        return stack
    }()
    // MARK: - Properties

    private var movie: Movie
    // MARK: - Initialization

    init(for movie: Movie) {
        self.movie = movie
        
        super.init(frame: .zero)
        setup()
    }

    required init(coder: NSCoder) {
        fatalError()
    }
    
    // MARK: - View lifecycle
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = bounds
    }
}

extension HeaderContentView: ViewCode {
    
    func customizeAppearance() {
        backgroundColor = .secondarySystemBackground
    }
    
    func addSubviews() {
        addSubview(backgroundImageView)
        addSubview(contentContainerStackView)
    }
    
    func addLayoutConstraints() {
        backgroundImageView.constrainTo(edgesOf: self)
        contentContainerStackView.constrainTo(edgesOf: self)
    }
    
}
