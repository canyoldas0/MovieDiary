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
    
    private lazy var upperStackView: UIStackView = {
        let temp = UIStackView(arrangedSubviews: [movieNameLabel, scoreLabel])
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.axis = .horizontal
        temp.distribution = .fillProportionally
        return temp
    }()
    
    private lazy var lowerStackView: UIStackView = {
        let temp = UIStackView(arrangedSubviews: [categoryLabel, releaseLabel])
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.axis = .horizontal
        temp.distribution = .fillProportionally
        return temp
    }()
    
    private lazy var stackView: UIStackView = {
       let temp = UIStackView(arrangedSubviews: [upperStackView, lowerStackView])
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.axis = .vertical
        temp.distribution = .fillEqually
        return temp
    }()
    
    override func addMajorFields() {
        super.addMajorFields()
        addViewComponents()
    }
    
    private func addViewComponents() {
        addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    override func loadDataToView() {
        super.loadDataToView()
//        guard let data = returnData() else { return }
    }
}
