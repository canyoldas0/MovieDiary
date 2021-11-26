//
//  MainViewBuilder.swift
//  MovieDiary
//
//  Created by Can Yoldas on 26.11.2021.
//

import UIKit

class MainViewBuilder {
    
    class func build() -> MainViewController {
        let viewModel = MainViewModel()
        let viewController = MainViewController(viewModel: viewModel)
        return viewController
    }
}
