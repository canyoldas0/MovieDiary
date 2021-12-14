//
//  SearchViewBuilder.swift
//  MovieDiary
//
//  Created by Can Yoldas on 14.12.2021.
//

import UIKit


class SearchViewBuilder {
    
    class func build() -> UIViewController {
        
        let viewModel = SearchViewModel()
        let viewController = SearchViewController(viewModel: viewModel)
        viewController.title = "Search"
        
        return viewController
    }
}
