//
//  Typealiases.swift
//  MovieDiary
//
//  Created by Can Yoldas on 4.12.2021.
//

import Foundation

typealias BaseUrl = EndpointHelper.BaseUrls
typealias Path = EndpointHelper.Paths

typealias MovieDetailRequestBlock = (MovieDetailDataRequest) -> Void
typealias MovieListViewStateBlock = (MovieListViewState) -> Void

// Search Blocks
typealias SearchTextChangeBlock = (String?) -> Void
typealias SearchButtonViewStateBlock = (Bool) -> Void
typealias SearchViewStateBlock = (SearchViewState) -> Void
