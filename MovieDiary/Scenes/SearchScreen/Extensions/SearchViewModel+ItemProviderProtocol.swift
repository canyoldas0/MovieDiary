//
//  SearchViewModel+ItemProviderProtocol.swift
//  MovieDiary
//
//  Created by Can Yoldas on 19.12.2021.
//

import Foundation
import BaseModules

extension SearchViewModel: ItemProviderProtocol {
    
    func askNumberOfSection() -> Int {
        return 0
    }
    
    func askNumberOfItem(in section: Int) -> Int {
        return dataFormatter.getNumberOfItem(in: section)
    }
    
    func askData(at index: Int) -> GenericDataProtocol? {
        return dataFormatter.getItem(at: index)
    }
    
    func selectedItem(at index: Int) {
        detailViewState?(MovieDetailDataRequest(movie_id: dataFormatter.getItemId(at: index)))
    }
    
    func isLoadingCell(for index: Int) -> Bool {
        return index + 1 >= dataFormatter.getCount()
    }
    
    func getMoreData() {
        guard dataFormatter.paginationData.checkLoadingMore() else { return }
        dataFormatter.paginationData.nextOffset()
        getData()
    }
    
}
