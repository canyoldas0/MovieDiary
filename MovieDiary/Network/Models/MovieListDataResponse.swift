//
//  MovieListDataResponse.swift
//  MovieDiary
//
//  Created by Can Yoldas on 4.12.2021.
//

import Foundation

struct MovieListDataResponse: Codable {
    let page: Int?
    let results: [MovieResult]
    let totalPages, totalResults: Int?

    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

// MARK: - Result
struct MovieResult: Codable {
    
    let adult: Bool?
    let backdropPath: String?
    let genreIDS: [Int]?
    let id: Int?
    let originalLanguage: OriginalLanguage?
    let originalTitle, overview: String?
    let popularity: Double?
    let posterPath, releaseDate, title: String?
    let video: Bool?
    let voteAverage: Double?
    let voteCount: Int?
    
    var backdropURL: String {
        return "https://image.tmdb.org/t/p/w500\(backdropPath ?? "")"
    }
    
    var posterURL: String {
           return "https://image.tmdb.org/t/p/w500\(posterPath ?? "")"
       }

    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case genreIDS = "genre_ids"
        case id
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview, popularity
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title, video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}

enum OriginalLanguage: String, Codable {
    case en = "en"
    case hi = "hi"
    case pt = "pt"
    case ru = "ru"
}
