//
//  MainViewDataFormatter.swift
//  MovieDiary
//
//  Created by Can Yoldas on 26.11.2021.
//

import Foundation
import BaseModules


protocol MainViewDataFormatterProtocol {
    
    func getItem(at index: Int) -> GenericDataProtocol?
    func getCount() -> Int
    func getNumberOfSection() -> Int
    func getNumbeOfItem(in section: Int) -> Int
}


class MainViewDataFormatter: MainViewDataFormatterProtocol {
    
    func getItem(at index: Int) -> GenericDataProtocol? {
        
        return CustomImageViewComponentData(imageUrl: "https://picsum.photos/200/300")
    }
    
    func getCount() -> Int {
        return 4
    }
    
    func getNumberOfSection() -> Int {
        return 1
    }
    
    func getNumbeOfItem(in section: Int) -> Int {
        return 4
    }

}
