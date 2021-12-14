//
//  MainViewBuilder.swift
//  MovieDiary
//
//  Created by Can Yoldas on 26.11.2021.
//

import UIKit

class MainViewBuilder {
    
    class func build() -> UIViewController {
        
        let dataFormatter = MainViewDataFormatter()
        let viewModel = MainViewModel(dataFormatter: dataFormatter)
        let viewController = MainViewController(viewModel: viewModel)
        let navigationVC = UINavigationController(rootViewController: viewController)
        viewController.title = "Popular Movies"
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = AppTheme.smooth.value
        viewController.navigationController?.navigationBar.standardAppearance = appearance
        viewController.navigationController?.navigationBar.scrollEdgeAppearance =
                                                viewController.navigationController?.navigationBar.standardAppearance
        return navigationVC
    }
}
