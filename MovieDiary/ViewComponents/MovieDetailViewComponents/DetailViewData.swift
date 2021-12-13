//
//  DetailViewData.swift
//  MovieDiary
//
//  Created by Can Yoldas on 6.12.2021.
//

import Foundation
import BaseModules

class DetailViewData: GenericDataProtocol {
    
    private(set) var imageData: CustomImageViewComponentData
    private(set) var movieName: String
    private(set) var categories: String
    private(set) var score: String
    private(set) var overview: String
    

    init(imageData: CustomImageViewComponentData,
         movieName: String,
         categories: String,
         score: String,
         overview: String
         
        ) {
        self.imageData = imageData
        self.movieName = movieName
        self.categories = categories
        self.score = score
        self.overview = overview
    }
}
