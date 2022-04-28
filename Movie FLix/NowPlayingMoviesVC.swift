//
//  ViewController.swift
//  Movie FLix
//
//  Created by Aditya Tyagi  on 19/04/22.
//

import UIKit
import Kingfisher
import youtube_ios_player_helper

private let identifier: String = "MovieCell"
private let unpopularCellIdentifier: String = "UnpopularMovieCell"


class NowPlayingMoviesVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet private weak var collectionView: UICollectionView!
    private var movies: [Movie]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let width = (view.frame.size.width - 20) / 3
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: width, height: 190)
        collectionView.dataSource = self
        collectionView.delegate = self
        fetch()
    }
    
    private func fetch() {
        API.fetchTrendingMovies { data in
            self.movies = data.results
            DispatchQueue.main.async {
                    self.collectionView.reloadData()
                  }
        }
    }
}
    extension NowPlayingMoviesVC {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell1 = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! MoviesCollectionViewCell
        cell1.movie = movies?[indexPath.item]
        let cell2 = collectionView.dequeueReusableCell(withReuseIdentifier: unpopularCellIdentifier, for: indexPath) as! UnpopularMoviesCollectionViewCell
        cell2.unpopularMovie = movies?[indexPath.item]
        if cell1.movie?.voteAverage ?? 0 < 7 {
            return cell2
        }else {
            return cell1
        }
    }
        
        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
           // let movie = movies?[indexPath.row]
            let vc = storyboard?.instantiateViewController(withIdentifier: "DetailMoviesVC") as? DetailMoviesVC
            vc?.movieDescriptionSent = movies?[indexPath.row].overview ?? "Description `NOT FOUND`"
          //  print(movies?[indexPath.row].title)
            vc?.moviesTitleSent = movies?[indexPath.row].title ?? "Title `NOT FOUND`"
            vc?.posterID = movies?[indexPath.row].backdropPath ?? "00000000"
            vc?.movieID = movies?[indexPath.row].id ?? 0
            vc?.rating = movies?[indexPath.row].voteAverage ?? 10
            
            self.navigationController?.pushViewController(vc!, animated: true)
        }
}
