//
//  MainTabBarBuilder.swift
//  MovieDiary
//
//  Created by Can Yoldas on 14.12.2021.
//

import UIKit

class MainTabBarBuilder {
    
    class func build() -> UIViewController {
        
        let mainViewController = MainViewBuilder.build()
//        let AccountViewController = AccountViewBuilder.build()

        let tabViewController = MainTabBarController()
        tabViewController.viewControllers = [mainViewController]
        tabViewController.tabBar.tintColor = .black
        tabViewController.tabBar.backgroundColor = .systemBackground
        
        return tabViewController
        
    }
    
}
