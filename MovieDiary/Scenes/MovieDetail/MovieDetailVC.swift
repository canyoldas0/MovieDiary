//
//  MovieDetailViewController.swift
//  MovieDiary
//
//  Created by Can Yoldas on 5.12.2021.
//

import UIKit
import BaseModules

class MovieDetailViewController: BaseViewController<MovieDetailViewModel> {
    
    private var mainComponent: MovieDetailView!
    
    override func prepareViewControllerSetup() {
        super.prepareViewControllerSetup()
        addViewComponents()
        listenViewModel()
        viewModel.getDetailData()
        modalPresentationStyle = .fullScreen
        view.backgroundColor = .clear
    }

    private func addViewComponents() {
        mainComponent = MovieDetailView()
        mainComponent.translatesAutoresizingMaskIntoConstraints = false
        mainComponent.delegate = viewModel
        view.addSubview(mainComponent)
      
        NSLayoutConstraint.activate([

            mainComponent.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mainComponent.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mainComponent.topAnchor.constraint(equalTo: view.topAnchor),
            mainComponent.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    private func listenViewModel() {
        
        viewModel.subscribeViewState { [weak self] state in
            
            switch state {
            case .done:
                self?.mainComponent.reloadTableView()
            case .failure:
                return // Error screen
            case .loading:
                return // Loading screen?
            }
        }
    }
}
