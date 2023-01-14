//
//  TableHeaderView.swift
//  LearningTask-13.1
//
//  Created by rafael.rollo on 10/06/2022.
//

import UIKit

// MARK: - Provided view components

class SessionsTableHeaderView: UIView {
    // MARK: - factory method
    
    static func build(from movie: Movie) -> SessionsTableHeaderView {
        let frame = CGRect(x: 0, y: 0, width: 0, height: 332)
        
        let headerView = SessionsTableHeaderView.init(with: frame, and: movie)
        return headerView
    }
    // MARK: - Subviews
    
    private lazy var headerContentView: HeaderContentView = {
        let headerView = HeaderContentView(for: movie)
        headerView.translatesAutoresizingMaskIntoConstraints = false
        return headerView
    }()
    
    private lazy var backDateButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(.init(named: "Backward Arrow"), for: .normal)
        button.tintColor = .secondaryLabel
        
        NSLayoutConstraint.activate([
            button.widthAnchor.constraint(equalToConstant: 24),
            button.heightAnchor.constraint(equalToConstant: 24),
        ])
        return button
    }()
    
    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .secondaryLabel
        label.font = .systemFont(ofSize: 14, weight: .bold)
        label.textAlignment = .center
        label.text = DateFormatter.format(date: self.date, to: .dayPlusMonth)
        return label
    }()
    
    private lazy var weekdateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .secondaryLabel
        label.font = .systemFont(ofSize: 14, weight: .light)
        label.textAlignment = .center
        label.text = Calendar.current.isDateInToday(self.date)
            ? "Hoje"
            : DateFormatter.format(date: self.date, to: .weekdayString)
        return label
    }()
    
    private lazy var dateStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.alignment = .fill
        stack.distribution = .fill
        stack.spacing = 2
        
        stack.addArrangedSubview(dateLabel)
        stack.addArrangedSubview(weekdateLabel)
        return stack
    }()
    
    private lazy var advanceDateButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(.init(named: "Forward Arrow"), for: .normal)
        button.tintColor = .secondaryLabel
        
        NSLayoutConstraint.activate([
            button.widthAnchor.constraint(equalToConstant: 24),
            button.heightAnchor.constraint(equalToConstant: 24),
        ])
        return button
    }()
    
    private lazy var dateControlsStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.backgroundColor = .secondarySystemBackground
        stack.axis = .horizontal
        stack.alignment = .center
        stack.distribution = .equalCentering
        stack.isLayoutMarginsRelativeArrangement = true
        stack.layoutMargins = UIEdgeInsets(top: 8, left: 24, bottom: 8, right: 24)
        
        NSLayoutConstraint.activate([
            stack.heightAnchor.constraint(equalToConstant: 56)
        ])
    
        stack.addArrangedSubview(backDateButton)
        stack.addArrangedSubview(dateStackView)
        stack.addArrangedSubview(advanceDateButton)
        return stack
    }()
    
    private lazy var containerStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.backgroundColor = .clear
        stack.axis = .vertical
        stack.alignment = .fill
        stack.distribution = .fill
        stack.spacing = 24
        stack.isLayoutMarginsRelativeArrangement = true
        stack.layoutMargins = UIEdgeInsets(top: 0, left: 0, bottom: 12, right: 0)
        
        stack.addArrangedSubview(headerContentView)
        stack.addArrangedSubview(dateControlsStackView)
        return stack
    }()
    // MARK: - Properties
    
    private var movie: Movie
    private var date = Date.now
    // MARK: - Initialization
    
    private init(with frame: CGRect, and movie: Movie) {
        self.movie = movie
        super.init(frame: frame)
        setup()
    }
    
    required init(coder: NSCoder) {
        fatalError("""
            Este componente de view deve ser utilizado como código.
            Consulte a documentação da API da classe UITableView e sua propriedade `tableHeaderView`.
        """)
    }
    
    private func setup() {
        applyTheme()
        addViews()
        addContraints()
    }
    
    private func applyTheme() {
        backgroundColor = .clear
    }
    
    private func addViews() {
        addSubview(containerStackView)
    }
    
    private func addContraints() {
        NSLayoutConstraint.activate([
            containerStackView.topAnchor.constraint(equalTo: self.topAnchor),
            containerStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            containerStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            containerStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
        ])
    }
}

fileprivate class HeaderContentView: UIView {
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
        
        NSLayoutConstraint.activate([
            button.widthAnchor.constraint(equalToConstant: 24),
            button.heightAnchor.constraint(equalToConstant: 24),
        ])
        return button
    }()
    
    private lazy var playTrailerButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(.init(named: "Play"), for: .normal)
        button.tintColor = .white
        
        NSLayoutConstraint.activate([
            button.widthAnchor.constraint(equalToConstant: 24),
            button.heightAnchor.constraint(equalToConstant: 24),
        ])
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

    private func setup() {
        applyTheme()
        addViews()
        addConstraints()
    }

    private func applyTheme() {
        backgroundColor = .secondarySystemBackground
    }
    
    private func addViews() {
        addSubview(backgroundImageView)
        addSubview(contentContainerStackView)
    }
    
    func addConstraints() {
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: self.topAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
        ])
        
        NSLayoutConstraint.activate([
            contentContainerStackView.topAnchor.constraint(equalTo: self.topAnchor),
            contentContainerStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            contentContainerStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            contentContainerStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
        ])
    }
    // MARK: - View lifecycle
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = bounds
    }
}
// MARK: - Reusable components

fileprivate class MovieRatingView: UILabel {
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

    private func setup() {
        applyTheme()
        addConstraints()
    }

    private func applyTheme() {
        backgroundColor = .secondaryLabel
        textColor = .white
        font = .systemFont(ofSize: 12, weight: .bold)
        textAlignment = .center
        
        layer.masksToBounds = true
        layer.cornerRadius = 4
    }
    
    func addConstraints() {
        NSLayoutConstraint.activate([
            widthAnchor.constraint(equalToConstant: 20),
            heightAnchor.constraint(equalToConstant: 20),
        ])
    }
}

fileprivate class MovieStatView: UIStackView {
    // MARK: - Configuration support
    
    enum Stat: Int, RawRepresentable {
        case criticsScore, publicScore
        
        var icon: UIImage? {
            switch self {
            case .criticsScore:
                return UIImage(named: "Tomato")
            case .publicScore:
                return UIImage(named: "Logo")
            }
        }
    }
    // MARK: - Subviews
    
    private lazy var iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        
        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalToConstant: 20),
            imageView.heightAnchor.constraint(equalToConstant: 20),
        ])
        
        return imageView
    }()
    
    private lazy var scoreLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = .systemFont(ofSize: 10, weight: .regular)
        return label
    }()
    // MARK: - Properties

    var stat: Stat? {
        didSet {
            guard let stat = stat else { return }
            iconImageView.image = stat.icon
        }
    }
    
    var score: Int? {
        didSet {
            guard let score = score else { return }
            scoreLabel.text = "\(score)%"
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

    private func setup() {
        applyTheme()
        addViews()
    }

    private func applyTheme() {
        axis = .horizontal
        alignment = .center
        distribution = .fill
        spacing = 2
    }
    
    private func addViews() {
        addArrangedSubview(iconImageView)
        addArrangedSubview(scoreLabel)
    }
}
