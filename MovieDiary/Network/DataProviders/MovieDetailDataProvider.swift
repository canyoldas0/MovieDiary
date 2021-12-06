//
//  MovieDetailDataProvider.swift
//  MovieDiary
//
//  Created by Can Yoldas on 5.12.2021.
//

import Foundation


class MovieDetailDataProvider : ApiServiceProvider<MovieDetailDataRequest> {
    
    init(request : MovieDetailDataRequest) {
        super.init(method: .get,
                   baseUrl: BaseUrl.base.rawValue,
                   path: Path.detail(request.movie_id ?? 0).value,
                   data: request)
    }
}
