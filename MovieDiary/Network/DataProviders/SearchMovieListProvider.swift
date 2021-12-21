//
//  SearchMovieListProvider.swift
//  MovieDiary
//
//  Created by Can Yoldas on 21.12.2021.
//

import Foundation

class SearchMovieListProvider: ApiServiceProvider<SearchMovieDataRequest> {
    
    init(request: SearchMovieDataRequest) {
        super.init(method: .get,
                   baseUrl: BaseUrl.base.rawValue,
                   path: Path.searchMovie.value,
                   data: request)
    }
}
