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
        viewController.tabBarItem.image = TabBarImages.home.value
        viewController.tabBarItem.selectedImage = TabBarImages.homeSelected.value
        
        return navigationVC
    }
}
