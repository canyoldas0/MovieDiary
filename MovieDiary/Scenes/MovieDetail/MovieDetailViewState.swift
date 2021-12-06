//
//  MovieDetailViewState.swift
//  MovieDiary
//
//  Created by Can Yoldas on 6.12.2021.
//

import Foundation

typealias MovieDetailViewStateBlock = (MovieDetailViewState) -> Void

enum MovieDetailViewState {
    
    case loading
    case done
    case failure
    
}
