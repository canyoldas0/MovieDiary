//
//  TitleLabelPack.swift
//  MovieDiary
//
//  Created by Can Yoldas on 9.12.2021.
//

import UIKit
import BaseModules

class TitleLabelPack: GenericBaseView<TitleLabelPackData> {
    
    private lazy var movieNameLabel: UILabel = {
        let temp = UILabel()
        temp.textAlignment = .center
        temp.text = "Movie Title "
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.font = MainFont.medium(16).value
        temp.numberOfLines = 0
        temp.lineBreakMode = .byWordWrapping
        return temp
    }()

    private lazy var categoryLabel: UILabel = {
        let temp = UILabel()
        temp.textAlignment = .center
        temp.text = "Categories "
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.font = MainFont.medium(14).value
        temp.numberOfLines = 0
        temp.lineBreakMode = .byWordWrapping
        return temp
    }()
    
    private lazy var scoreLabel: UILabel = {
        let temp = UILabel()
        temp.textAlignment = .center
        temp.text = "7.4 / 10 "
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.font = MainFont.medium(14).value
        temp.numberOfLines = 0
        temp.lineBreakMode = .byWordWrapping
        return temp
    }()
    
    private lazy var releaseLabel: UILabel = {
        let temp = UILabel()
        temp.textAlignment = .center
        temp.text = "Release date 121231231 "
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.font = MainFont.medium(14).value
        temp.numberOfLines = 0
        temp.lineBreakMode = .byWordWrapping
        return temp
    }()
    
}
