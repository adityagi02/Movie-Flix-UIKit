//
//  TrailerResults.swift
//  Movie FLix
//
//  Created by Aditya Tyagi  on 26/04/22.
//

import Foundation

struct TrailerResults: Decodable {
    let id: Int
    let results: [DataSource]
}
