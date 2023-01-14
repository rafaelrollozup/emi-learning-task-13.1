//
//  MoviesViewController.swift
//  LearningTask-13.1
//
//  Created by rafael.rollo on 13/06/2022.
//

import UIKit

class MoviesViewController: UICollectionViewController {
    
    var moviesAPI: MoviesAPI?
    var movieSessionsAPI: MovieSessionsAPI?
    
    var movies: [Movie] = [] {
        didSet {
            collectionView.reloadData()
        }
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "seeMovieSessionsSegue" else { return }
        
        guard let cell = sender as? MovieViewCell,
              let destinationController = segue.destination as? MovieSessionsViewController else {
            fatalError("Não foi possível executar a segue \(segue.identifier!)")
        }
        
        destinationController.movie = cell.movie
        destinationController.API = movieSessionsAPI
    }

}

// MARK: - UICollectionViewDataSource implementations
extension MoviesViewController {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieViewCell", for: indexPath) as? MovieViewCell else {
            fatalError("Não foi possível obter uma célula para a lista de filmes em cartaz")
        }
        
        let movie = movies[indexPath.row]
        
        cell.movie = movie
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            guard let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "MovieSectionHeaderView", for: indexPath) as? MovieSectionHeaderView else {
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
extension MoviesViewController {
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let movie = movies[indexPath.row]
        print("Selecionado o filme \(movie.title)")
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
