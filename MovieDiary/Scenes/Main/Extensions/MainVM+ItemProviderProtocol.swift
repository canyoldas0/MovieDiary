//
//  MainVM+ItemProviderProtocol.swift
//  MovieDiary
//
//  Created by Can Yoldas on 26.11.2021.
//

import Foundation
import BaseModules

extension MainViewModel: ItemProviderProtocol {
    
    func askNumberOfSection() -> Int {
        return 0
    }
    
    func askNumberOfItem(in section: Int) -> Int {
        return 0
    }
    
    func askData(at index: Int) -> GenericDataProtocol? {
        return nil
    }
    
    
}
