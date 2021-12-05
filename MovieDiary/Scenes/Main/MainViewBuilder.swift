//
//  MainViewBuilder.swift
//  MovieDiary
//
//  Created by Can Yoldas on 26.11.2021.
//

import UIKit

class MainViewBuilder {
    
    class func build() -> MainViewController {
        
        let dataFormatter = MainViewDataFormatter()
        let viewModel = MainViewModel(dataFormatter: dataFormatter)
        let viewController = MainViewController(viewModel: viewModel)
        viewController.title = "Home"
        return viewController
    }
}
