//
//  MainViewController.swift
//  MovieDiary
//
//  Created by Can Yoldas on 26.11.2021.
//

import UIKit
import BaseModules

class MainViewController: BaseViewController<MainViewModel> {
    
    var topCollectionView : TopCollectionView!
    
    override func prepareViewControllerSetup() {
        addViewComponents()
        view.backgroundColor = .white
        
    }
    
    private func addViewComponents() {
        topCollectionView = TopCollectionView()
        topCollectionView.translatesAutoresizingMaskIntoConstraints = false
        topCollectionView.delegate = viewModel
        view.addSubview(topCollectionView)
        
        NSLayoutConstraint.activate([
        
            topCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            topCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            topCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            topCollectionView.heightAnchor.constraint(equalToConstant: 200)
        ])
        
    }
}
