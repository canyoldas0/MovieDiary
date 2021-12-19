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
    
    override func prepareViewControllerSetup() {
        super.prepareViewControllerSetup()
        setupVC()
    }
    
    private func setupVC() {
        addSearchButton()
        subscribeViewModel()
        view.backgroundColor = AppTheme.bright.value
    }
    
    // MARK: - SearchBar Methods
    private func addSearchButton() {
        searchBar.sizeToFit()
        navigationItem.title = "Search"
        navigationController?.navigationBar.prefersLargeTitles = false
        searchBar.delegate = viewModel
        searchBar.scopeButtonTitles = ["Movies", "Apps", "Books", "Music"]
        searchBar.showsScopeBar = true
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
    }

}
