//
//  DetailView.swift
//  MovieDiary
//
//  Created by Can Yoldas on 6.12.2021.
//

import UIKit
import BaseModules

class DetailView: GenericBaseView<DetailViewData> {
    
    //MARK: - View Components
    private lazy var imageContainer: CustomImageViewComponentContainer = {
        let temp = CustomImageViewComponentContainer()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.layer.cornerRadius = 2
        temp.heightAnchor.constraint(equalToConstant: 100).isActive = true
        temp.widthAnchor.constraint(equalToConstant: 100).isActive = true
        temp.clipsToBounds = true
        return temp
    }()
    
    private lazy var movieNameLabel: UILabel = {
        let temp = UILabel()
        temp.textAlignment = .center
        temp.text = " "
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.font = MainFont.medium(14).value
        temp.numberOfLines = 0
        temp.lineBreakMode = .byWordWrapping
        return temp
    }()
    
    override func addMajorFields() {
        super.addMajorFields()
        addViewComponents()
    }
    
    private func addViewComponents() {
        addSubview(imageContainer)
        addSubview(movieNameLabel)
        
        NSLayoutConstraint.activate([
        
            imageContainer.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageContainer.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            movieNameLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            movieNameLabel.topAnchor.constraint(equalTo: imageContainer.bottomAnchor, constant: -30)
        ])
    }
    
    override func loadDataToView() {
        super.loadDataToView()
        guard let data = returnData() else { return }
        
        self.imageContainer.setData(data: data.imageData)
        self.movieNameLabel.text = data.movieName
    }
    
    
}
