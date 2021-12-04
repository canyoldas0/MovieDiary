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
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        let temp = UICollectionView(frame: .zero, collectionViewLayout: layout)
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.delegate = self
        temp.dataSource = self
        temp.showsHorizontalScrollIndicator = false
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
    
    func reloadCollectionView() {
        DispatchQueue.main.async {
            self.collectionComponent.reloadData()
        }
    }
}

extension TopCollectionView: UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return delegate?.askNumberOfItem(in: section) ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let data = delegate?.askData(at: indexPath.row) else { return UICollectionViewCell() }
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TopCollectionViewCell.identifier, for: indexPath) as? TopCollectionViewCell else { return UICollectionViewCell() }
        cell.setData(by: data)
        
        return cell
    }
    
    
}

// MARK: - UICollectionViewDelegateFlowLayout
extension TopCollectionView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = (UIScreen.main.bounds.width - 50) / 2
        return CGSize(width: width, height: 250)
        
    }
    
}
