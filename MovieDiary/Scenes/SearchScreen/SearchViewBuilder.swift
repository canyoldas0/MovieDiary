//
//  SearchViewBuilder.swift
//  MovieDiary
//
//  Created by Can Yoldas on 14.12.2021.
//

import UIKit

class SearchViewBuilder {
    
    class func build() -> UIViewController {
        
        let dataFormatter = SearchDataFormatter()
        let viewModel = SearchViewModel(dataFormatter: dataFormatter)
        let viewController = SearchViewController(viewModel: viewModel)
        viewController.title = "Search Movie"
        viewController.tabBarItem.image = TabBarImages.search.value
        let navigationVC = UINavigationController(rootViewController: viewController)
        navigationVC.navigationBar.backgroundColor = AppTheme.smooth.value
        viewController.view.backgroundColor = AppTheme.smooth.value
   
        return navigationVC
    }
}
