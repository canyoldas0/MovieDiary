//
//  MovieDetailDataFormatter+Protocol.swift
//  MovieDiary
//
//  Created by Can Yoldas on 5.12.2021.
//

import Foundation
import BaseModules

protocol MovieDetailDataFormatterProtocol {
    
    func setDetailData(by response: MovieListDataResponse) //TODO?
    func getItem(at index: Int) -> GenericDataProtocol?
    func getImageUrl(at index: Int) -> String
}

class MovieDetailDataFormatter: MovieDetailDataFormatterProtocol {
    
    private var list : [MovieResult] = [MovieResult]()
    
    func setDetailData(by response: MovieListDataResponse) {
        self.list.append(contentsOf: response.results)
    }
    
    func getItem(at index: Int) -> GenericDataProtocol? {
        
        return CustomImageViewComponentData(imageUrl: getImageUrl(at: index))
    }
    
    func getImageUrl(at index: Int) -> String {
        return list[index].posterURL
    }
    
    
    
    
}
