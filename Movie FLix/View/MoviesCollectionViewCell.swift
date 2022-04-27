//
//  MoviesCollectionViewCell.swift
//  Movie FLix
//
//  Created by Aditya Tyagi  on 19/04/22.
//
import UIKit
import Kingfisher

class MoviesCollectionViewCell: UICollectionViewCell {
    var movie: Movie? {
        didSet{
            if let movie = movie {
                movieImage.kf.setImage(with: movie.backdropPath.url)
                
            }
        }
    }

    @IBOutlet private weak var movieImage: UIImageView!
    
}


extension String{
    var url: URL? {
        return URL(string: "\(posterURL)\(self)")
    }
}
