//
//  PurchaseSettingsViewController.swift
//  LearningTask-13.1
//
//  Created by rafael.rollo on 19/07/2022.
//

import UIKit

class PurchaseSettingsViewController: UIViewController {

    // MARK: - Subviews
    private lazy var logoTitleView: LogoTitleView = {
        let view = LogoTitleView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .tertiarySystemBackground
        view.isLayoutMarginsRelativeArrangement = true
        view.layoutMargins = .init(top: 16, left: 16, bottom: 16, right: 16)
        return view
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.register(PurchaseSettingsMenuItemCell.self, forCellReuseIdentifier: PurchaseSettingsMenuItemCell.reuseId)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .secondarySystemBackground
        tableView.setContentHuggingPriority(.defaultHigh, for: .vertical)
        tableView.tableFooterView = UIView(frame: .init(origin: .zero, size: .init(width: .zero, height: 42)))
        return tableView
    }()
    
    private lazy var totalCostLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textAlignment = .center
        label.text = "R$ 0,00"
        return label
    }()
    
    private lazy var footerView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            totalCostLabel
        ])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.constrainHeight(to: 62)
        return stackView
    }()
    
    private lazy var containerView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            logoTitleView,
            tableView,
            footerView,
        ])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .fill
        return stackView
    }()
    
    // MARK: - Properties
    var movieSession: Session!
    
    var menuItems: [MenuItem] = MenuItem.allCases
    var itemActiveIndex: Int = 0
    
    // MARK: - Lifecycle
    override func loadView() {
        super.loadView()
        setup()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        setupViews()
    }
    
    func setupViews() {
        tableView.tableHeaderView = PurchaseSettingsTableHeaderView.build(from: movieSession)
    }

}

extension PurchaseSettingsViewController: ViewCode {
    
    func customizeAppearance() {
        view.backgroundColor = .tertiarySystemBackground
    }
    
    func addSubviews() {
        view.addSubview(containerView)
    }
    
    func addLayoutConstraints() {
        containerView.constrainTo(safeEdgesOf: self.view)
    }
    
}

extension PurchaseSettingsViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PurchaseSettingsMenuItemCell.reuseId, for: indexPath) as? PurchaseSettingsMenuItemCell else {
            fatalError("Não foi possível recuperar uma celula para o item de menu em Purchase Settings")
        }
        
        cell.menuItem = menuItems[indexPath.row]
        cell.active = indexPath.row == itemActiveIndex
        return cell
    }

}
