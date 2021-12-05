//
//  MainViewDataFormatter.swift
//  MovieDiary
//
//  Created by Can Yoldas on 26.11.2021.
//

import Foundation
import BaseModules


protocol MainViewDataFormatterProtocol {
    
    func setData(with response: MovieListDataResponse)
    func getItem(at index: Int) -> GenericDataProtocol?
    func getCount() -> Int
    func getNumberOfSection() -> Int
    func getNumberOfItem(in section: Int) -> Int
    func getImageUrl(at index: Int) -> String
    func getItemId(at index:Int) -> Int
}


class MainViewDataFormatter: MainViewDataFormatterProtocol {
    
    private var componentData : MovieListDataResponse?
    private var list : [MovieResult] = [MovieResult]()
    
    func setData(with response: MovieListDataResponse) {
        self.componentData = response
        self.list.append(contentsOf: response.results)
        print(list.count)
    }
    
    func getItem(at index: Int) -> GenericDataProtocol? {
        
        return CustomImageViewComponentData(imageUrl: getImageUrl(at: index))
    }
    
    func getImageUrl(at index: Int) -> String {
        return list[index].posterURL
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
    
    func getItemId(at index: Int) -> Int {
        return list[index].id ?? 0
    }

}
