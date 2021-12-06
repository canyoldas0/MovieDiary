//
//  MovieDetailDataFormatter+Protocol.swift
//  MovieDiary
//
//  Created by Can Yoldas on 5.12.2021.
//

import Foundation
import BaseModules

protocol MovieDetailDataFormatterProtocol {
    
    func setDetailData(by response: MovieDetailDataResponse) //TODO?
    func getItem(at index: Int) -> GenericDataProtocol?
    func getImageUrl(at index: Int) -> String
    func getNumberOfItem(in section:Int) -> Int
}

class MovieDetailDataFormatter: MovieDetailDataFormatterProtocol {
    
    private var list : [MovieDetailDataResponse] = [MovieDetailDataResponse]()
    
    func setDetailData(by response: MovieDetailDataResponse) {
        self.list.append(response)
    }
    
    func getItem(at index: Int) -> GenericDataProtocol? {
        
        return DetailViewData(imageData: getImageData(at: index),
                              movieName: getMovieName(at: index)
        )
        
    }
    
    func getMovieName(at index:Int) -> String {
        return list[index].originalTitle ?? ""
    }
    
    func getImageData(at index:Int) -> CustomImageViewComponentData {
        return CustomImageViewComponentData(imageUrl: getImageUrl(at: index))
    }
    
    func getImageUrl(at index: Int) -> String {
        return list[index].posterURL
    }
    
    func getNumberOfItem(in section:Int) -> Int {
        return list.count
    }
    
}
