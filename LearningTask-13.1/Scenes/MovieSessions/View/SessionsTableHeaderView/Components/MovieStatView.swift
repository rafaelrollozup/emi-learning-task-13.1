//
//  MovieStatView.swift
//  LearningTask-13.1
//
//

import UIKit

class MovieStatView: UIStackView {
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
        imageView.constrainSize(to: .init(width: 20, height: 20))
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
    
}

extension MovieStatView: ViewCode {

    func customizeAppearance() {
        axis = .horizontal
        alignment = .center
        distribution = .fill
        spacing = 2
    }
    
    func addSubviews() {
        addArrangedSubview(iconImageView)
        addArrangedSubview(scoreLabel)
    }
    
}

