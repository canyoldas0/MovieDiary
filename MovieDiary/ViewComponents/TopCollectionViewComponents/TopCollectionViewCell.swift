//
//  TopCollectionViewCell.swift
//  MovieDiary
//
//  Created by Can Yoldas on 26.11.2021.
//

import UIKit
import BaseModules

class TopCollectionViewCell: BaseCollectionViewCell {
    
    //card for each item to be displayed
    private lazy var imageContainer: CustomImageViewComponentContainer = {
        let temp = CustomImageViewComponentContainer()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.layer.cornerRadius = 10
        temp.heightAnchor.constraint(equalToConstant: 100).isActive = true
        temp.widthAnchor.constraint(equalToConstant: 100).isActive = true
        temp.clipsToBounds = true
        return temp
    }()
    
    override func addMajorViews() {
        super.addMajorViews()
        addImageContainer()
    }
    
    private func addImageContainer() {
        contentView.addSubview(imageContainer)

        NSLayoutConstraint.activate([

            imageContainer.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageContainer.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageContainer.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageContainer.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),


        ])

    }

    func setData(by value: GenericDataProtocol) {
        guard let data = value as? CustomImageViewComponentData else { return }
        imageContainer.setData(data: data)
    }
}
