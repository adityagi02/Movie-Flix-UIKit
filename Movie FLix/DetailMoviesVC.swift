//
//  DetailMoviesVC.swift
//  Movie FLix
//
//  Created by Aditya Tyagi  on 21/04/22.
//

import UIKit
import AVKit
import AVFoundation
import youtube_ios_player_helper

class DetailMoviesVC: UIViewController {

    
    private var movies: [DataSource]?
    
    @IBOutlet weak var playerView: YTPlayerView!
    @IBOutlet weak var moviesDescription: UILabel!
    @IBOutlet weak var moviesTitle: UILabel!
    @IBOutlet weak var ratingStars: UILabel!
    var moviesTitleSent = ""
    var movieDescriptionSent = ""
    var posterID = " "
    var rating: Double = 0
    var movieID: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.moviesTitle.text = moviesTitleSent
        self.moviesDescription.text = movieDescriptionSent
        let numberOfStars = Int(rating)
        var stars: String = ""
        var count: Int = 0
        while(count<numberOfStars){
            stars = stars + "⭐️"
            count = count+1
        }
        self.ratingStars.text = stars
        self.playerView.load(withVideoId: "mqqft2x_Aa4")
    }
    
    
    public func fetch() {
        API.fetchTrendingMoviesTrailers(movieID: movieID) { data in
            self.movies = data.results
        }
    }
    
}

