//
//  DataSource.swift
//  Movie FLix
//
//  Created by Aditya Tyagi  on 23/04/22.
//

import Foundation

struct DataSource: Codable {
        let key: String
        let site: String
        let size: Int
        let type: String
        let official: Bool
        let publishedAt, id: String
}
