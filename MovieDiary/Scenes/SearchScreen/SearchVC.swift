//
//  SearchVC.swift
//  MovieDiary
//
//  Created by Can Yoldas on 14.12.2021.
//

import UIKit
import BaseModules

class SearchViewController: BaseViewController<SearchViewModel> {
    
    private let searchBar = UISearchBar()
    private var searchView: SearchView!
    
    override func prepareViewControllerSetup() {
        super.prepareViewControllerSetup()
        setupVC()
    
    }
    
    private func setupVC() {
        addSearchButton()
        addSearchView()
        subscribeViewModel()
        
    }
    
    private func addSearchView() {
        searchView = SearchView()
        searchView.translatesAutoresizingMaskIntoConstraints = false
        searchView.delegate = viewModel
        
        view.addSubview(searchView)
        
        NSLayoutConstraint.activate([
        
            searchView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            searchView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            searchView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            searchView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    // MARK: - SearchBar Methods
    private func addSearchButton() {
        searchBar.sizeToFit()
        searchBar.delegate = viewModel
        searchBar.showsScopeBar = false
        searchBar.barTintColor = AppTheme.bright.value
        showSearchBarButton(shouldShow: true)
        searchBar.tintColor = .black
    }
    
    private func showSearchBarButton(shouldShow: Bool) {
        let searchButton = UIBarButtonItem(barButtonSystemItem: .search,
                                           target: self,
                                           action: #selector(handleShowSearchBar))
        searchButton.tintColor = .black
        if shouldShow {
            navigationItem.rightBarButtonItem = searchButton
        } else {
            navigationItem.titleView = nil
        }
    }
    
    @objc func handleShowSearchBar() {
            search(shouldShow: true)
            navigationItem.rightBarButtonItem = nil
            searchBar.becomeFirstResponder()
    }
    
    private func search(shouldShow: Bool) {
            showSearchBarButton(shouldShow: !shouldShow)
            searchBar.showsCancelButton = shouldShow
            navigationItem.titleView = shouldShow ? searchBar : nil
    }
    
    private func subscribeViewModel() {
        
        viewModel.subscribeSearchBarState { [weak self] state in
            self?.search(shouldShow: state)
        }
        
        viewModel.subscribeState { [weak self] state in
            
            switch state {
                
            case .done:
                self?.searchView.reloadTableView()
            case .failure:
                return
            case .loading:
                return
            }
        }
        
        viewModel.subscribeDetailViewState { request in
            self.fireDetailView(with: request)
        }
    }
    
    private func fireDetailView(with data: MovieDetailDataRequest) {
        
        let viewController = MovieDetailViewBuilder.build(with: data)
        self.navigationController?.present(viewController, animated: true, completion: nil)
        
    }

}
