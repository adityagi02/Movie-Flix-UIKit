//
//  DetailMoviesVC.swift
//  Movie FLix
//
//  Created by Aditya Tyagi  on 21/04/22.
//

import UIKit
import AVKit
import AVFoundation

class DetailMoviesVC: UIViewController {

    
    private var movies: [DataSource]?
    
    @IBOutlet weak var moviesDescription: UILabel!
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var moviesTitle: UILabel!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var ratingStars: UILabel!
    var moviesTitleSent = ""
    var movieDescriptionSent = ""
    var posterID = " "
    var rating: Double = 0
    var movieID: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
   //      print(posterID)
        movieImage.kf.setImage(with: posterID.url)
        self.moviesTitle.text = moviesTitleSent
        self.moviesDescription.text = movieDescriptionSent
        var numberOfStars = Int(rating)
        var stars: String = ""
        var count: Int = 0
        while(count<numberOfStars){
            stars = stars + "⭐️"
            count = count+1
        }
        self.ratingStars.text = stars
 //       print(stars)
    }
    
    public func fetch() {
        API.fetchTrendingMoviesTrailers(movieID: movieID) { data in
            self.movies = data.results
      //      print(self.movies)
        }
    }
    
    @IBAction func playVideo(_ sender: UIButton) {
        guard let url = URL(string: "https://www.youtube.com/watch?v=mqqft2x_Aa4") else { return }

        // Create an AVPlayer, passing it the HTTP Live Streaming URL.
        let player = AVPlayer(url: url)

        // Create a new AVPlayerViewController and pass it a reference to the player.
        let controller = AVPlayerViewController()
        controller.player = player

        // Modally present the player and call the player's play() method when complete.
        present(controller, animated: true) {
            player.play()
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
   

}

