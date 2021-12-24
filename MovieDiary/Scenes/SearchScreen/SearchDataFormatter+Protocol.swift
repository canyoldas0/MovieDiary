//
//  SearchDataFormatter+Protocol.swift
//  MovieDiary
//
//  Created by Can Yoldas on 19.12.2021.
//

import Foundation
import BaseModules

protocol SearchDataFormatterProtocol {
    
    var paginationData: PaginationInfo { get set }
    
    func setData(with response: MovieListDataResponse)
    func clearList()
    func getItem(at index: Int) -> GenericDataProtocol?
    func getCount() -> Int
    func getNumberOfSection() -> Int
    func getNumberOfItem(in section: Int) -> Int
    func getTitle(at index: Int) -> String
    func getImageUrl(at index: Int) -> String
    func getScore(at index: Int) -> String
    func getReleaseYear(at index: Int) -> String
    func getItemId(at index: Int) -> Int
    
}

class SearchDataFormatter: SearchDataFormatterProtocol {
    
    private var list: [MovieResult] = [MovieResult]()
    var paginationData: PaginationInfo = PaginationInfo()
    
    func setData(with response: MovieListDataResponse) {
        self.paginationData.resultCount = response.results.count
        self.list.append(contentsOf: response.results)
    }
    
    func clearList() {
        self.list = []
        self.paginationData.reset()
    }
    
    func getItem(at index: Int) -> GenericDataProtocol? {
        return SearchViewData(imageData: CustomImageViewComponentData(imageUrl: getImageUrl(at: index)),
                              movieName: getTitle(at: index),
                              releaseDate: getReleaseYear(at: index),
                              score: getScore(at: index))
    }
    
    func getCount() -> Int {
        return list.count
    }
    
    func getNumberOfSection() -> Int {
        return 1
    }
    
    func getNumberOfItem(in section: Int) -> Int {
        return list.count
    }
    
    func getTitle(at index: Int) -> String {
        return list[index].title ?? ""
    }
    
    func getImageUrl(at index: Int) -> String {
        return list[index].posterURL
    }
    
    func getScore(at index: Int) -> String {
        
        return "\(list[index].voteAverage ?? 0)/10"
    }
    
    func getReleaseYear(at index: Int) -> String {
        let dateFormatter = DateFormatter()
        let dateString = list[index].releaseDate
        
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "yyyy-MM-dd"
        guard let date = dateFormatter.date(from: dateString ?? "") else { return ""}
        
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .none
        dateFormatter.locale = Locale.current
        let finalDateString = dateFormatter.string(from: date)
        
        return "(\(finalDateString))"
        
    }
    
    func getItemId(at index: Int) -> Int {
        return list[index].id ?? 0
    }
}
