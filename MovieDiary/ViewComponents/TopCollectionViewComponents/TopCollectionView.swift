//
//  TopCollectionView.swift
//  MovieDiary
//
//  Created by Can Yoldas on 26.11.2021.
//

import UIKit
import BaseModules

class TopCollectionView: GenericBaseView<TopCollectionViewData> {
    
    weak var delegate: ItemProviderProtocol?
    
    private lazy var collectionComponent: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 25
        layout.minimumInteritemSpacing = 0
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        let temp = UICollectionView(frame: .zero, collectionViewLayout: layout)
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.delegate = self
        temp.dataSource = self
        temp.register(TopCollectionViewCell.self, forCellWithReuseIdentifier: TopCollectionViewCell.identifier)
//        temp.register(LoadingCellView.self, forCellWithReuseIdentifier: LoadingCellView.identifier)
        return temp
    }()
    
    override func addMajorFields() {
        super.addMajorFields()
        addCollectionComponent()
    }
    
    private func addCollectionComponent() {
        
        addSubview(collectionComponent)
        
        NSLayoutConstraint.activate([
            
            collectionComponent.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionComponent.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionComponent.topAnchor.constraint(equalTo: topAnchor),
            collectionComponent.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
        
    }
}

extension TopCollectionView: UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
}