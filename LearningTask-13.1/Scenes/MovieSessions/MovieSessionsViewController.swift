//
//  MovieSessionsViewController.swift
//  LearningTask-13.1
//
//  Created by rafael.rollo on 10/06/2022.
//

import UIKit

class MovieSessionsViewController: UIViewController {
    
    // MARK: - Subviews
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .tertiarySystemBackground
        tableView.register(SessionsTableSectionHeaderView.self,
                        forHeaderFooterViewReuseIdentifier: SessionsTableSectionHeaderView.reuseId)
        tableView.register(SessionViewCell.self, forCellReuseIdentifier: SessionViewCell.reuseId)
        return tableView
    }()
    
    // MARK: - Properties
    var API: MovieSessionsAPI?
    
    var movie: Movie!
    
    var sessions: [Sessions] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func loadView() {
        super.loadView()
        setup()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        
        // Do any additional setup after loading the view.
        loadSessions()
    }
    
    func setupViews() {
        navigationItem.title = movie.shortTitle
        
        tableView.tableHeaderView = SessionsTableHeaderView.build(from: movie)
    }
    
    func loadSessions() {
        guard let API = API else { return }
        sessions = API.getSessionBy(movie)
    }
    
    func navigateToPurchaseSettings(with session: Session) {
//        let controller = PurchaseSettingsViewController()
        let controller = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "PurchaseSettingsViewController") as! PurchaseSettingsViewController
        
        controller.movieSession = session
        
        navigationController?.present(controller, animated: true)
    }

}

extension MovieSessionsViewController: ViewCode {
    
    func addSubviews() {
        view.addSubview(tableView)
    }
    
    func addLayoutConstraints() {
        tableView.constrainTo(edgesOf: self.view)
    }
    
}

// MARK: - UITableViewDataSource Implementations
extension MovieSessionsViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sessions.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sessions[section].all.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SessionViewCell.reuseId, for: indexPath) as? SessionViewCell else {
            fatalError("Não foi possível recuperar celula para tabela")
        }
        
        let session = sessions[indexPath.section].all[indexPath.row]
        cell.movieSession = session
        
        return cell
    }
    
}

// MARK: - UITableViewDelegate Implementations
extension MovieSessionsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let movieSession = sessions[indexPath.section].all[indexPath.row]
        navigateToPurchaseSettings(with: movieSession)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: SessionsTableSectionHeaderView.reuseId) as? SessionsTableSectionHeaderView else {
            fatalError("Não foi possível recuperar celula para tabela")
        }
        
        let cinema = sessions[section].cinema
        
        headerView.cinema = cinema
        return headerView
    }
    
}
