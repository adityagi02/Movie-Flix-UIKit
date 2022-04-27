//
//  UnpopularMoviesCollectionViewCell.swift
//  Movie FLix
//
//  Created by Aditya Tyagi  on 21/04/22.
//

import UIKit
import Kingfisher

class UnpopularMoviesCollectionViewCell: UICollectionViewCell {
    var unpopularMovie: Movie? {
        didSet{
            if let movie = unpopularMovie {
                posterImage.kf.setImage(with: movie.posterPath.UnpopularMovieurl)
                unpopularMovieTitle.text = unpopularMovie?.title
                posterDescription.text = unpopularMovie?.overview
            }
        }
    }
    @IBOutlet weak var unpopularMovieTitle: UILabel!
    @IBOutlet private weak var posterImage: UIImageView!
    @IBOutlet weak var posterDescription: UILabel!
}


extension String{
    var UnpopularMovieurl: URL? {
        return URL(string: "\(posterURL)\(self)")
    }
}
