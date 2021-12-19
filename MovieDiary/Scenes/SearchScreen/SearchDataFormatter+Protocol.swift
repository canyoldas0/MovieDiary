//
//  SearchDataFormatter+Protocol.swift
//  MovieDiary
//
//  Created by Can Yoldas on 19.12.2021.
//

import Foundation
import BaseModules

protocol SearchDataFormatterProtocol {
    
//    func setData(with response: MovieListDataResponse)
    func getItem(at index: Int) -> GenericDataProtocol?
    func getCount() -> Int
    func getNumberOfSection() -> Int
    func getNumberOfItem(in section: Int) -> Int
    func getImageUrl(at index: Int) -> String
    func getItemId(at index: Int) -> Int
    
}

class SearchDataFormatter: SearchDataFormatterProtocol {
    
    func getItem(at index: Int) -> GenericDataProtocol? {
        return nil
    }
    
    func getCount() -> Int {
        return 1
    }
    
    func getNumberOfSection() -> Int {
        return 1
    }
    
    func getNumberOfItem(in section: Int) -> Int {
        return 1
    }
    
    func getImageUrl(at index: Int) -> String {
        return "1"
    }
    
    func getItemId(at index: Int) -> Int {
        return 1
    }
}

