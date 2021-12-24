//
//  MainTabBarBuilder.swift
//  MovieDiary
//
//  Created by Can Yoldas on 14.12.2021.
//

import UIKit

class MainTabBarBuilder {
    
    class func build() -> UIViewController {
        
        let mainVC = MainViewBuilder.build()
        let searchVC = SearchViewBuilder.build()

        let tabViewController = MainTabBarController()
        tabViewController.viewControllers = [mainVC, searchVC]
        tabViewController.tabBar.tintColor = .black
        tabViewController.tabBar.backgroundColor = AppTheme.bright.value
        
        return tabViewController
        
    }
    
}
