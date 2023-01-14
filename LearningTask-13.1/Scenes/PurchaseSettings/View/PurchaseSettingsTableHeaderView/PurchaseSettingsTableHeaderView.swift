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
        view.constrainHeight(to: 1)
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
        stackView.constrainHeight(to: 32)
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

}

extension PurchaseSettingsTableHeaderView: ViewCode {
    
    func customizeAppearance() {
        backgroundColor = .secondarySystemBackground
    }
    
    func addSubviews() {
        addSubview(containerWrapperView)
    }
    
    func addLayoutConstraints() {
        containerWrapperView.constrainTo(edgesOf: self)
    }

}
