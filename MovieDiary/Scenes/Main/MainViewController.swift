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
        viewModel.getData()
        subscribeViewModelListeners()
        
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
            topCollectionView.heightAnchor.constraint(equalToConstant: 300)
        ])
        
    }
    
   
    
    private func subscribeViewModelListeners() {
        
        viewModel.subscribePopularList { state in
            
            switch state {
            case .done:
                self.topCollectionView.reloadCollectionView()
            case .failure:
                return
            case .loading:
                return
                
            }
        }
        
        viewModel.subscribeDetailViewState { [weak self] data in
            self?.fireDetailView(with: data)
        }
    }
    
    private func fireDetailView(with data: MovieDetailDataRequest) {
        
        let viewController = MovieDetailViewBuilder.build(with: data)
        navigationController?.pushViewController(viewController, animated: true)
        
    }
}
