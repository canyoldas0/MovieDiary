//
//  MovieDetailVM+ItemProviderProtocol.swift
//  MovieDiary
//
//  Created by Can Yoldas on 6.12.2021.
//

import Foundation
import BaseModules

extension MovieDetailViewModel: ItemProviderProtocol {
    
    func askNumberOfSection() -> Int {
        return 0
    }
    
    func askNumberOfItem(in section: Int) -> Int {
        return dataFormatter.getNumberOfItem(in: section)
    }
    
    func askData(at index: Int) -> GenericDataProtocol? {
        return dataFormatter.getItem(at: index)
    }
}
