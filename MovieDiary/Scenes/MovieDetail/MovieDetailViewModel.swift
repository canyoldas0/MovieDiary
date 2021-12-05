//
//  MovieDetailViewModel.swift
//  MovieDiary
//
//  Created by Can Yoldas on 5.12.2021.
//

import Foundation


class MovieDetailViewModel {
    
    private let requestData : MovieDetailDataRequest
    private let dataFormatter: MovieDetailDataFormatterProtocol
    
    
    
    init(formatter : MovieDetailDataFormatterProtocol,
         requestData : MovieDetailDataRequest) {
        self.requestData = requestData
        self.dataFormatter = formatter
    }
    
    private func getMovieDetailRequest() -> MovieDetailDataRequest {
        
        return self.requestData
    }
    
    func getDetailData() {
        do {
            guard let urlRequest = try? MovieDetailDataProvider(request: getMovieDetailRequest()).returnUrlRequest() else { return }
        //viewState?(.loading)
            fireApiCall(with:urlRequest, with: dataListener)
            print(urlRequest)
        }
    }
    
    private func fireApiCall(with request: URLRequest, with completion : @escaping (Result<MovieListDataResponse, ErrorResponse>) -> Void) {
        
        NetworkManager.shared.createRequest(urlRequest: request, completion: completion)
    }
    
    private func apiCallHandler(from response: MovieListDataResponse) {
        
        //let data = response.results[0]
        dataFormatter.setDetailData(by: response)
        // We let VC know that we have data now.
        //viewState?(.done)
        
    }
    
    private lazy var dataListener : (Result<MovieListDataResponse, ErrorResponse>) -> Void = { [weak self] result in
        
        switch result {
            case .failure(let error):
                print("error : \(error)")
            case .success(let response):
                self?.apiCallHandler(from: response)
        }
    }
    
    
}
