//
//  SearchTableViewCell.swift
//  MovieDiary
//
//  Created by Can Yoldas on 19.12.2021.
//

import UIKit
import BaseModules

class SearchTableViewCell: BaseTableViewCell {
    
    private lazy var imageContainer: CustomImageViewComponentContainer = {
        let temp = CustomImageViewComponentContainer()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.layer.cornerRadius = 10
        temp.heightAnchor.constraint(equalToConstant: 196).isActive = true
        temp.widthAnchor.constraint(equalToConstant: 108).isActive = true
        temp.clipsToBounds = true
        return temp
    }()
    
    private lazy var titleLabel: UILabel = {
        let temp = UILabel()
        temp.textAlignment = .left
        temp.text = " "
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.font = MainFont.bold(15).value
        temp.numberOfLines = 0
        temp.lineBreakMode = .byWordWrapping
        return temp
    }()
    
    private lazy var titleStackView: UIStackView = {
        let temp = UIStackView(arrangedSubviews: [titleLabel])
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.axis = .vertical
        temp.distribution = .fillEqually
        temp.spacing = 5
        temp.alignment = .leading
        return temp
    }()
    
    override func setupView() {
        super.setupView()
        addViewComponents()
    }
    
    private func addViewComponents() {
        contentView.addSubview(imageContainer)
        contentView.addSubview(titleStackView)
        
        NSLayoutConstraint.activate([
        
            imageContainer.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            imageContainer.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            imageContainer.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            
            titleStackView.leadingAnchor.constraint(equalTo: imageContainer.trailingAnchor, constant: 10),
            titleStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            titleStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            titleStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
             
        ])
    }
    
    func setData(by value: GenericDataProtocol) {
        guard let data = value as? SearchViewData else { return }
        titleLabel.text = "\(data.movieName) \(data.releaseDate)"
        imageContainer.setData(data: data.imageData)
    }
}
