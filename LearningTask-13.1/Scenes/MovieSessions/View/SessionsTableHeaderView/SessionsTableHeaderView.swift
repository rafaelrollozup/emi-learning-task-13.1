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
        button.constrainSize(to: .init(width: 24, height: 24))
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
        button.constrainSize(to: .init(width: 24, height: 24))
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
        stack.constrainHeight(to: 56)
        
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
    
}

extension SessionsTableHeaderView: ViewCode {
    
    func customizeAppearance() {
        backgroundColor = .clear
    }
    
    func addSubviews() {
        addSubview(containerStackView)
    }
    
    func addLayoutConstraints() {
        containerStackView.constrainTo(edgesOf: self)
    }
    
}
