//
//  SearchViewModel.swift
//  MovieDiary
//
//  Created by Can Yoldas on 14.12.2021.
//

import Foundation

class SearchViewModel: NSObject {
    
    var searchTerm: String = ""
    var dataFormatter: SearchDataFormatterProtocol
    var searchBarViewState: SearchButtonViewStateBlock?
    var detailViewState: MovieDetailRequestBlock?
    var searchWorkItem: DispatchWorkItem?
    var state: SearchViewStateBlock?
    
    init(dataFormatter: SearchDataFormatterProtocol) {
        self.dataFormatter = dataFormatter
    }
    
    // MARK: - Subscribe States
    public func subscribeSearchBarState(with completion: @escaping SearchButtonViewStateBlock) {
        searchBarViewState = completion
    }
    
    func subscribeState(completion: @escaping SearchViewStateBlock) {
        state = completion
    }
    
    func subscribeDetailViewState(completion: @escaping MovieDetailRequestBlock) {
        detailViewState = completion
    }
    
    func getData() {
        do {
            guard let urlRequest = try? SearchMovieListProvider(request: getSearchMovieDataRequest()).returnUrlRequest() else { return }
            fireApiCall(with: urlRequest, with: apiCallHandler)
            print(urlRequest)
        }
    }
    
    private func fireApiCall(with request: URLRequest, with completion: @escaping (Result<MovieListDataResponse, ErrorResponse>) -> Void) {
        
        NetworkManager.shared.createRequest(urlRequest: request, completion: completion)
    }
    
    private func dataHandler(with response: MovieListDataResponse) {
        dataFormatter.paginationData.fetching = false
        dataFormatter.setData(with: response)
        state?(.done)
    }
    
    private func getSearchMovieDataRequest () -> SearchMovieDataRequest {
        return SearchMovieDataRequest(query: searchTerm,
                                      page: dataFormatter.paginationData.page)
    }
    
    private lazy var apiCallHandler: (Result<MovieListDataResponse, ErrorResponse>) -> Void = { [weak self] result in
        
        switch result {
        case .failure(let error):
            self?.state?(.failure)
        case .success(let data):
            // passing data to dataFormatter
            self?.dataHandler(with: data)
        }
    }
    
}
