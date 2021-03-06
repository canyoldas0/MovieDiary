//
//  EndpointHelper.swift
//  MovieDiary
//
//  Created by Can Yoldas on 4.12.2021.
//

import Foundation
import BaseModules

enum EndpointHelper {
    
    enum BaseUrls: String {
        case base = "https://api.themoviedb.org/3/"
     
    }
    
    enum Paths: GenericValueProtocol {
        
        typealias Value = String
        
        var value: String {
            switch self {
            case .popularMovies:
                return "movie/popular"
            case .detail(let id):
                return "movie/\(id)"
            case .searchMovie:
                return "search/movie"
            }
        }
        
        case popularMovies
        case detail(Int)
        case searchMovie

    }
   
}
