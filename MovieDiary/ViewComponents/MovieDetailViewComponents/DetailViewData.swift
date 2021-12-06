//
//  DetailViewData.swift
//  MovieDiary
//
//  Created by Can Yoldas on 6.12.2021.
//

import Foundation
import BaseModules

class DetailViewData : GenericDataProtocol {
    
    private(set) var imageData: CustomImageViewComponentData
    private(set) var movieName: String

    
    init(imageData: CustomImageViewComponentData,
         movieName: String
        ) {
        self.imageData = imageData
        self.movieName = movieName
        
    }
}
