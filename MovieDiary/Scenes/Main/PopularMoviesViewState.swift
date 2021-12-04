//
//  PopularMoviesViewState.swift
//  MovieDiary
//
//  Created by Can Yoldas on 4.12.2021.
//

import Foundation

typealias PopularMoviesStateBlock = (PopularMoviesViewState) -> Void

enum PopularMoviesViewState {
    
    case loading
    case done
    case failure
    
}
