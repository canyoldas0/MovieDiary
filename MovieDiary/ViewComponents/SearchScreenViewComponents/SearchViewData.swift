//
//  SearchBarViewData.swift
//  MovieDiary
//
//  Created by Can Yoldas on 19.12.2021.
//

import Foundation
import BaseModules

class SearchViewData: GenericDataProtocol {
    
    private(set) var imageData: CustomImageViewComponentData
    private(set) var movieName: String
    private(set) var releaseDate: String
    private(set) var score: String
    
    init(imageData: CustomImageViewComponentData,
         movieName: String,
         releaseDate: String,
         score: String
    ) {
        self.imageData = imageData
        self.movieName = movieName
        self.releaseDate = releaseDate
        self.score = score
    }
}
