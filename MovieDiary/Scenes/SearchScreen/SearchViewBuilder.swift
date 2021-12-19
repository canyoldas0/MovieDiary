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
        viewController.tabBarItem.image = TabBarImages.search.value
        let navigationVC = UINavigationController(rootViewController: viewController)
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = AppTheme.smooth.value
        viewController.navigationController?.navigationBar.prefersLargeTitles = false
        viewController.navigationController?.navigationBar.standardAppearance = appearance
        viewController.navigationController?.navigationBar.scrollEdgeAppearance =
                                                viewController.navigationController?.navigationBar.standardAppearance
        
        return navigationVC
    }
}
