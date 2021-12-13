//
//  MainViewModel.swift
//  MovieDiary
//
//  Created by Can Yoldas on 26.11.2021.
//

import Foundation

class MainViewModel {
    
    let dataFormatter: MainViewDataFormatterProtocol!
    
    private var popularMoviesState: MovieListViewStateBlock?
    var detailViewState: MovieDetailRequestBlock?
    
    init(dataFormatter: MainViewDataFormatterProtocol) {
        self.dataFormatter = dataFormatter
    }
    
    func subscribePopularList(completion: @escaping MovieListViewStateBlock) {
        popularMoviesState = completion
    }
    
    func subscribeDetailViewState(with completion: @escaping MovieDetailRequestBlock) {
        detailViewState = completion
    }
    
    func getData() {
        do {
            guard let urlRequest = try? PopularMovieListProvider(request: getPopularMovieListRequest()).returnUrlRequest() else { return }
            fireApiCall(with: urlRequest, with: apiCallHandler)
            print(urlRequest)
        }
    }
    
    private func fireApiCall(with request: URLRequest, with completion: @escaping (Result<MovieListDataResponse, ErrorResponse>) -> Void) {
        
        NetworkManager.shared.createRequest(urlRequest: request, completion: completion)
    }
    
    private func dataHandler(with response: MovieListDataResponse) {
        
        dataFormatter.setData(with: response)
        popularMoviesState?(.done)
    }
    
    private func getPopularMovieListRequest() -> PopularMovieListDataRequest {
        
        return PopularMovieListDataRequest()
    }
    
    private lazy var apiCallHandler: (Result<MovieListDataResponse, ErrorResponse>) -> Void = { [weak self] result in
        
        switch result {
        case .success(let data):
            self?.dataHandler(with: data)
        case .failure(let error):
            print(error)
        }

    }
    
}
