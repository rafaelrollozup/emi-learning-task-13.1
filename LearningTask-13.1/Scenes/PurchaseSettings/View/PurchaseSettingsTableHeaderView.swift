//
//  PurchaseSettingsTableHeaderView.swift
//  LearningTask-13.1
//
//  Created by rafael.rollo on 15/06/2022.
//

import UIKit

class PurchaseSettingsTableHeaderView: UIView {
    
    static func build(from movieSession: Session) -> PurchaseSettingsTableHeaderView {
        let frame = CGRect(x: 0, y: 0, width: 0, height: 350)
        
        let headerView = PurchaseSettingsTableHeaderView.init(with: frame, and: movieSession)
        return headerView
    }
    
    private static let baseLayoutMargins = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
    
    private lazy var logoTitleView: LogoTitleView = {
        let view = LogoTitleView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .tertiarySystemBackground
        view.isLayoutMarginsRelativeArrangement = true
        view.layoutMargins = Self.baseLayoutMargins
        return view
    }()
    
    private lazy var moviePosterImageView: MoviePosterImageView = {
        let imageView = MoviePosterImageView.init(byDownloading: movieSession.movie.posterImageURI)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var movieTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .secondaryLabel
        label.font = .systemFont(ofSize: 20, weight: .medium)
        label.numberOfLines = 3
        label.text = movieSession.movie.title
        return label
    }()
    
    private lazy var sessionLocationInfoItem: SessionInfoItem = {
        let view = SessionInfoItem()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.icon = UIImage(named: "LocationPin")
        view.text = movieSession.cinema?.name
        return view
    }()
    
    private lazy var dateInfoItem: SessionInfoItem = {
        let view = SessionInfoItem()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.icon = UIImage(named: "Calendar")
        view.text = DateFormatter.format(date: movieSession.dateTime,
                                         to: .weekdayStringPlusDateAndHours).capitalized
        return view
    }()
    
    private lazy var sessionTypeInfoTag: SessionInfoTag = {
        let label = SessionInfoTag()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.info = movieSession.type.rawValue
        return label
    }()
    
    private lazy var sessionVideoTypeInfoTag: SessionInfoTag = {
        let label = SessionInfoTag()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.info = "2d"
        return label
    }()
    
    private lazy var tagInfoWrapper: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            sessionTypeInfoTag, sessionVideoTypeInfoTag
        ])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.alignment = .center
        stackView.spacing = 8
        
        let paddingView = UIView()
        stackView.addArrangedSubview(paddingView)
        return stackView
    }()
    
    private lazy var movieInfoContainer: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            movieTitleLabel,
            sessionLocationInfoItem,
            dateInfoItem,
            tagInfoWrapper,
        ])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.spacing = 16
        return stackView
    }()
    
    private lazy var contentContainerView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            moviePosterImageView, movieInfoContainer
        ])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.alignment = .top
        stackView.spacing = 16
        return stackView
    }()
    
    private lazy var separatorView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .tertiaryLabel
        
        NSLayoutConstraint.activate([
            view.heightAnchor.constraint(equalToConstant: 1)
        ])
        return view
    }()
    
    private lazy var receiptOptionsButton: UIButton = {
        var container = AttributeContainer()
        container.font = .systemFont(ofSize: 14)
        
        var configuration = UIButton.Configuration.plain()
        configuration.attributedTitle = AttributedString("Formas de retirada", attributes: container)
        configuration.image = .init(named: "Receipt")
        configuration.imagePadding = 8
        
        let button = UIButton(configuration: configuration)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = .secondaryLabel
        return button
    }()
    
    private lazy var removeSessionButton: UIButton = {
        var container = AttributeContainer()
        container.font = .systemFont(ofSize: 14)
        
        var configuration = UIButton.Configuration.plain()
        configuration.attributedTitle = AttributedString("Remover", attributes: container)
        configuration.image = .init(named: "TrashBin")
        configuration.imagePadding = 8
        
        let button = UIButton(configuration: configuration)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = .secondaryLabel
        return button
    }()
    
    private lazy var menuContainerView: UIStackView = {
        let paddingView = UIView()
        paddingView.setContentHuggingPriority(.defaultLow, for: .horizontal)
        
        let stackView = UIStackView(arrangedSubviews: [
            receiptOptionsButton, paddingView, removeSessionButton
        ])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.alignment = .center
        
        NSLayoutConstraint.activate([
            stackView.heightAnchor.constraint(equalToConstant: 32)
        ])
        return stackView
    }()
    
    private lazy var containerView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            contentContainerView,
            separatorView,
            menuContainerView
        ])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.spacing = 16
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = Self.baseLayoutMargins
        return stackView
    }()
    
    private lazy var containerWrapperView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            logoTitleView,
            containerView
        ])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .fill
        return stackView
    }()

    var movieSession: Session
    
    private init(with frame: CGRect, and movieSession: Session) {
        self.movieSession = movieSession
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        addTheme()
        addViews()
        addConstraints()
    }
    
    private func addTheme() {
        backgroundColor = .secondarySystemBackground
    }
    
    private func addViews() {
        addSubview(containerWrapperView)
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            containerWrapperView.topAnchor.constraint(equalTo: self.topAnchor),
            containerWrapperView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            containerWrapperView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            containerWrapperView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
    }
    
    // MARK: - Subcomponents
    private class SessionInfoItem: UIView {
        
        private lazy var iconImageView: UIImageView = {
            let imageView = UIImageView()
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.contentMode = .scaleAspectFill
            imageView.tintColor = .secondaryLabel
            
            NSLayoutConstraint.activate([
                imageView.widthAnchor.constraint(equalToConstant: 20),
                imageView.heightAnchor.constraint(equalToConstant: 20),
            ])
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
        
        private func setup() {
            addViews()
            addConstraints()
        }
        
        private func addViews() {
            addSubview(contentView)
        }
        
        private func addConstraints() {
            NSLayoutConstraint.activate([
                contentView.topAnchor.constraint(equalTo: self.topAnchor),
                contentView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
                contentView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
                contentView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            ])
        }
    }
    
    private class SessionInfoTag: UIView {
        // MARK: Subviews
        
        private lazy var textLabel: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.textColor = .white
            label.font = .systemFont(ofSize: 12, weight: .bold)
            label.textAlignment = .center
            return label
        }()
        
        // MARK: Properties

        var info: String? {
            didSet {
                textLabel.text = info
            }
        }
        
        // MARK: Initialization
        
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
            addConstraints()
        }

        private func applyTheme() {
            backgroundColor = .systemOrange
            layer.masksToBounds = true
            layer.cornerRadius = 4
        }
        
        private func addViews() {
            addSubview(textLabel)
        }
        
        func addConstraints() {
            NSLayoutConstraint.activate([
                heightAnchor.constraint(equalToConstant: 20),
            ])
            
            NSLayoutConstraint.activate([
                textLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
                textLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
                textLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8),
            ])
        }
    }
    
}

