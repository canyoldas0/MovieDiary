//
//  SearchMovieDataRequest.swift
//  MovieDiary
//
//  Created by Can Yoldas on 21.12.2021.
//

import Foundation

class SearchMovieDataRequest: Codable {
    
    private(set) public var page: Int
    private(set) public var query: String
    private(set) public var api_key: String = "da341460ab89e31e92146f13adfbe54c"
    
    init(query: String,
         page: Int = 1) {
        self.query = query
        self.page = page
    }
}
