//
//  MovieSessionsViewController.swift
//  LearningTask-13.1
//
//  Created by rafael.rollo on 10/06/2022.
//

import UIKit

class MovieSessionsViewController: UITableViewController {
    
    var API: MovieSessionsAPI?
    
    var movie: Movie!
    
    var sessions: [Sessions] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        setupViews()
        loadSessions()
    }
    
    func setupViews() {
        navigationItem.title = movie.shortTitle
        
        tableView.tableHeaderView = SessionsTableHeaderView.build(from: movie)
        tableView.register(SessionsTableSectionHeaderView.self,
                           forHeaderFooterViewReuseIdentifier: SessionsTableSectionHeaderView.reuseId)
        tableView.sectionHeaderHeight = SessionsTableSectionHeaderView.heightConstant
    }
    
    func loadSessions() {
        guard let API = API else { return }
        sessions = API.getSessionBy(movie)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "seePurchaseSettingsSegue" else { return }
        
        guard let cell = sender as? SessionViewCell,
              let destinationController = segue.destination as? PurchaseSettingsViewController else {
            fatalError("Não foi possível executar a segue \(segue.identifier!)")
        }
        
        destinationController.movieSession = cell.movieSession
    }

}

// MARK: - UITableViewDataSource Implementations
extension MovieSessionsViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return sessions.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sessions[section].all.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SessionCell", for: indexPath) as? SessionViewCell else {
            fatalError("Não foi possível recuperar celula para tabela")
        }
        
        let session = sessions[indexPath.section].all[indexPath.row]
        cell.movieSession = session
        
        return cell
    }
    
}

// MARK: - UITableViewDelegate Implementations
extension MovieSessionsViewController {
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("navega para compra de ingresso")
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: SessionsTableSectionHeaderView.reuseId) as? SessionsTableSectionHeaderView else {
            fatalError("Não foi possível recuperar celula para tabela")
        }
        
        let cinema = sessions[section].cinema
        headerView.setup(from: cinema)
        
        return headerView
    }
    
}
