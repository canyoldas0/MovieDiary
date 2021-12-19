//
//  SearchViewModel.swift
//  MovieDiary
//
//  Created by Can Yoldas on 14.12.2021.
//

import Foundation

class SearchViewModel: NSObject {
    
    var searchBarViewState: SearchButtonViewStateBlock?
    
    public func subscribeSearchBarState(with completion: @escaping SearchButtonViewStateBlock) {
        searchBarViewState = completion
    }
}
