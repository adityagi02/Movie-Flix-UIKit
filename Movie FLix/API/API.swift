//
//  API.swift
//  Movie FLix
//
//  Created by Aditya Tyagi  on 19/04/22.
//

import Foundation
import Alamofire

private let baseURL = "https://api.themoviedb.org/3/movie/"
let posterURL = "https://image.tmdb.org/t/p/original"
let apiKey = "86bc758fa6b42bf3ec3433b90e5652c4"
private let coder = JSONDecoder()


class API {
    class func fetchTrendingMovies(_ onSuccess: @escaping (Results) -> Void){
        coder.keyDecodingStrategy = .convertFromSnakeCase
        let urlStr = "https://api.themoviedb.org/3/movie/now_playing?api_key=\(apiKey)"
        guard let url = URL(string: urlStr) else { fatalError("Unable to get URL") }
        AF.request(url).response { response in
            switch response.result {
            case.success(let data):
                guard let data = data else { fatalError("Unable to parse data from API") }
                guard let results = try? coder.decode(Results.self, from: data) else { fatalError("Unable to parse data from JSON") }
                    onSuccess(results)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    class func fetchTrendingMoviesTrailers(movieID: Int,_ onSuccess: @escaping (TrailerResults) -> Void){
        coder.keyDecodingStrategy = .convertFromSnakeCase
        let str1 = "\(movieID)"
        let urlStr = "https://api.themoviedb.org/3/movie/\(str1)/videos?api_key=\(apiKey)"
        guard let url = URL(string: urlStr) else { fatalError("Unable to get URL") }
        AF.request(url).response { response in
            switch response.result {
            case.success(let data):
                guard let data = data else { fatalError("Unable to parse data from API") }
                guard let results = try? coder.decode(TrailerResults.self, from: data) else { fatalError("Unable to parse data from JSON") }
                    onSuccess(results)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
}
