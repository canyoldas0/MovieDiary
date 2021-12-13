//
//  MainViewDataFormatter.swift
//  MovieDiary
//
//  Created by Can Yoldas on 26.11.2021.
//

import Foundation
import BaseModules

protocol MainViewDataFormatterProtocol {
    
    var paginationData: PaginationInfo { get set }
    
    func setData(with response: MovieListDataResponse)
    func getItem(at index: Int) -> GenericDataProtocol?
    func getCount() -> Int
    func getNumberOfSection() -> Int
    func getNumberOfItem(in section: Int) -> Int
    func getImageUrl(at index: Int) -> String
    func getItemId(at index: Int) -> Int
}

class MainViewDataFormatter: MainViewDataFormatterProtocol {
    
    private var list: [MovieResult] = [MovieResult]()
    var paginationData: PaginationInfo = PaginationInfo()
    
    func setData(with response: MovieListDataResponse) {
        self.paginationData.resultCount = response.results.count
        self.list.append(contentsOf: response.results)
    }
    
    func getItem(at index: Int) -> GenericDataProtocol? {
        
        return CustomImageViewComponentData(imageUrl: getImageUrl(at: index))
    }
    
    func getNumberOfSection() -> Int {
        return 1
    }
    
    func getNumberOfItem(in section: Int) -> Int {
        return list.count
    }
    
    func getCount() -> Int {
        return list.count
    }
    
    // MARK: - Get Properties
    func getImageUrl(at index: Int) -> String {
        return list[index].posterURL
    }
    
    func getItemId(at index: Int) -> Int {
        return list[index].id ?? 0
    }

}
