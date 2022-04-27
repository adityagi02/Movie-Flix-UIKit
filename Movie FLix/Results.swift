//
//  Results.swift
//  Movie FLix
//
//  Created by Aditya Tyagi  on 19/04/22.
//

import Foundation

struct Results: Codable {

    let results: [Movie]
    let page: Int
    let totalPages: Int
    let totalResults: Int

}

