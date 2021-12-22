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
        self.searchTerm = text
        self.dataFormatter.clearList()
        self.getData()
        }
        
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        self.getData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.searchBarViewState?(false)
    }
}
