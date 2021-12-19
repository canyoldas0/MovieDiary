//
//  TabBarImages.swift
//  MovieDiary
//
//  Created by Can Yoldas on 15.12.2021.
//

import UIKit
import BaseModules

enum TabBarImages: String, GenericValueProtocol {

    typealias Value = UIImage
    
    var value: UIImage {
        return UIImage(imageLiteralResourceName: rawValue)
    }
    
    case search = "search"
    case home = "home"
    case favorite = "favorite"
    case searchSelected = "magnifyingglass.circle.fill"
    case homeSelected = "homeSelected"
    case favoriteSelected = "favoriteSelected"
    
}
