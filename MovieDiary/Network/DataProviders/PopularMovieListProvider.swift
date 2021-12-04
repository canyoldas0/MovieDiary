//
//  PopularMovieListProvider.swift
//  MovieDiary
//
//  Created by Can Yoldas on 4.12.2021.
//

import Foundation

class PopularMovieListProvider: ApiServiceProvider<PopularMovieListDataRequest> {
    
    init(request: PopularMovieListDataRequest) {
        super.init(method: .get,
                   baseUrl: BaseUrl.base.rawValue,
                   path: Path.popularMovies.value,
                   data: request)
    }
}
