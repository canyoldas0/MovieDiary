//
//  SearchViewModel+SearchBar.swift
//  MovieDiary
//
//  Created by Can Yoldas on 19.12.2021.
//

import UIKit

extension SearchViewModel: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        let text = searchText.replacingOccurrences(of: " ", with: "+")
//        viewModel.term = text
//        viewModel.clearOffset()
        
        if text.count > 2 {
//            searchWorkItem?.cancel()
//            let newTask = DispatchWorkItem { [weak self] in
//                self?.viewModel.getData()
//                self?.mainComponent.reloadCollectionView()
            }
//            self.searchWorkItem = newTask
//            DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: newTask)
        }
    
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
//        viewModel.clearOffset()
//        let entity = viewModel.selectedScopeToPathConverter(scope: selectedScope)
//        viewModel.entity = entity
//        viewModel.getData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.searchBarViewState?(false)
    }
}
