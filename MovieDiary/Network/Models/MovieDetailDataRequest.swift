//
//  MovieDetailDataRequest.swift
//  MovieDiary
//
//  Created by Can Yoldas on 5.12.2021.
//

import Foundation

class MovieDetailDataRequest: Codable {
    
    private(set) public var movie_id: Int?
    private(set) public var api_key: String = "da341460ab89e31e92146f13adfbe54c"
    
    init(movie_id: Int? = nil) {
        self.movie_id = movie_id
    }
    
    
}

