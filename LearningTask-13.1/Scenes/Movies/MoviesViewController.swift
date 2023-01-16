//
//  MoviesViewController.swift
//  LearningTask-13.1
//
//  Created by rafael.rollo on 13/06/2022.
//

import UIKit

class MoviesViewController: UIViewController {
    // MARK: - Subviews
    
    private static var layout: UICollectionViewFlowLayout {
        let baseItemSize = CGSize(width: 180, height: 314.5)
        let baseHeaderSize = CGSize(width: .zero, height: 50)
        let sectionInsets = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = baseItemSize
        layout.headerReferenceSize = baseHeaderSize
        layout.minimumInteritemSpacing = 16
        layout.minimumLineSpacing = 24
        layout.sectionInset = sectionInsets
        return layout
    }
    
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: MoviesViewController.layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(MovieViewCell.self, forCellWithReuseIdentifier: MovieViewCell.reuseId)
        collectionView.register(MovieSectionHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: MovieSectionHeaderView.reuseId)
        collectionView.showsVerticalScrollIndicator = true
        collectionView.backgroundColor = .tertiarySystemBackground
        return collectionView
    }()
    
    // MARK: - Properties
    
    var moviesAPI: MoviesAPI?
    var movieSessionsAPI: MovieSessionsAPI?
    
    var movies: [Movie] = [] {
        didSet {
            collectionView.reloadData()
        }
    }
    
    override func loadView() {
        super.loadView()
        setup()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        applyTheme()
        
        // Do any additional setup after loading the view.
        loadMovies()
    }
    
    func loadMovies() {
        guard let moviesAPI = moviesAPI else { return }
        movies = moviesAPI.loadMovies()
    }
    
    func navigateToMovieSessions(with movie: Movie) {
        let controller = MovieSessionsViewController()
        controller.API = movieSessionsAPI
        controller.movie = movie
        
        navigationController?.pushViewController(controller, animated: true)
    }

}

// MARK: - ViewCode Controller
extension MoviesViewController: ViewCode {

    func addSubviews() {
        view.addSubview(collectionView)
    }
    
    func addLayoutConstraints() {
        collectionView.constrainTo(edgesOf: self.view)
    }
    
}

// MARK: - UICollectionViewDataSource implementations
extension MoviesViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieViewCell.reuseId, for: indexPath) as? MovieViewCell else {
            fatalError("Não foi possível obter uma célula para a lista de filmes em cartaz")
        }
        
        let movie = movies[indexPath.row]
        
        cell.movie = movie
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            guard let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: MovieSectionHeaderView.reuseId, for: indexPath) as? MovieSectionHeaderView else {
                fatalError("Não foi possível obter view suplementar para a lista de filmes em cartaz")
            }

            headerView.title = "Filmes em Cartaz"
            return headerView

        default:
            fatalError("Tipo de view suplementar não suportado: \(kind)")
        }
    }
    
}

// MARK: - UICollectionViewDelegate implementations
extension MoviesViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let movie = movies[indexPath.row]
        print("Selecionado o filme \(movie.title)")
        
        navigateToMovieSessions(with: movie)
    }
    
}

extension MoviesViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        guard let flowLayout = collectionViewLayout as? UICollectionViewFlowLayout else {
            fatalError("É esperado que a lista de filmes em cartaz trabalhe com base em UICollectionViewFlowLayout")
        }
        
        let itemsPerLine: CGFloat = 2
        
        let margins = flowLayout.sectionInset
        let itemsSpacing = flowLayout.minimumInteritemSpacing
        
        let utilWidth = collectionView.bounds.width
                        - ( margins.left + margins.right )
                        - itemsSpacing * ( itemsPerLine - 1 )
        
        let posterAspectRatio = CGSize(width: 27, height: 40)
        let labelHeight: CGFloat = 48
        
        let itemWidth = utilWidth / itemsPerLine
        let itemHeight = itemWidth * posterAspectRatio.height / posterAspectRatio.width
                        + labelHeight
    
        return CGSize(width: itemWidth, height: itemHeight)
    }
    
}
