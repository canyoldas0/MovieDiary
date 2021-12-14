//
//  MovieDetailDataFormatter+Protocol.swift
//  MovieDiary
//
//  Created by Can Yoldas on 5.12.2021.
//

import Foundation
import BaseModules

protocol MovieDetailDataFormatterProtocol {
    
    func setDetailData(by response: MovieDetailDataResponse)
    func getNumberOfItem(in section: Int) -> Int
    func getItem(at index: Int) -> GenericDataProtocol?
    func getImageUrl(at index: Int) -> String
    func getReleaseYear(at index: Int) -> String
    func getCategories(at index: Int) -> String
    func getScore(at index: Int) -> String
    func getOverview(at index: Int) -> String
    
}

class MovieDetailDataFormatter: MovieDetailDataFormatterProtocol {
   
    private var list: [MovieDetailDataResponse] = [MovieDetailDataResponse]()
    
    func setDetailData(by response: MovieDetailDataResponse) {
        self.list.append(response)
    }
    
    func getItem(at index: Int) -> GenericDataProtocol? {
        
        return DetailViewData(imageData: getImageData(at: index),
                              movieName: getMovieName(at: index),
                              categories: getCategories(at: index),
                              score: getScore(at: index),
                              overview: getOverview(at: index)
                              
        )
        
    }

    func getMovieName(at index: Int) -> String {
        return "\(list[index].originalTitle ?? "") \(getReleaseYear(at: index))"
    }
    
    func getReleaseYear(at index: Int) -> String {
        let dateFormatter = DateFormatter()
        let dateString = list[index].releaseDate
        
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "yyyy-MM-dd"
        guard let date = dateFormatter.date(from: dateString ?? "") else { return ""}
        print("date \(date)")
        
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .none
        dateFormatter.locale = Locale.current
        let finalDateString = dateFormatter.string(from: date)
        
        return "(\(finalDateString))"
        
    }
    
    func getScore(at index: Int) -> String {
        
        return "\(list[index].voteAverage ?? 0)/10"
    }
    
    func getCategories(at index: Int) -> String {
        guard let arr = list[index].genres else { return "" }
        let stringArr: [String] = arr.map { $0.name!}
        
        return stringArr.joined(separator: ", ")
    }
    
    func getOverview(at index: Int) -> String {
        return "\(list[index].overview ?? "")"
    }
    
    func getImageData(at index: Int) -> CustomImageViewComponentData {
        return CustomImageViewComponentData(imageUrl: getImageUrl(at: index))
    }
    
    func getImageUrl(at index: Int) -> String {
        return list[index].posterURL
    }
    
    func getNumberOfItem(in section: Int) -> Int {
        return list.count
    }
}
