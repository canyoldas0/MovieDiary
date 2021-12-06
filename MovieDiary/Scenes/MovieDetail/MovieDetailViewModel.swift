//
//  MovieDetailViewModel.swift
//  MovieDiary
//
//  Created by Can Yoldas on 5.12.2021.
//

import Foundation


class MovieDetailViewModel {
    
    private let requestData : MovieDetailDataRequest
    let dataFormatter: MovieDetailDataFormatterProtocol
    
    private var viewState: MovieDetailViewStateBlock?
    
    init(formatter : MovieDetailDataFormatterProtocol,
         requestData : MovieDetailDataRequest) {
        self.requestData = requestData
        self.dataFormatter = formatter
    }
    
    private func getMovieDetailRequest() -> MovieDetailDataRequest {
        
        return self.requestData
    }
    
    func subscribeViewState(with completion : @escaping MovieDetailViewStateBlock) {
        viewState = completion
    }
    
    func getDetailData() {
        do {
            guard let urlRequest = try? MovieDetailDataProvider(request: getMovieDetailRequest()).returnUrlRequest() else { return }
            viewState?(.loading)
            fireApiCall(with:urlRequest, with: dataListener)
        }
    }
    
    private func fireApiCall(with request: URLRequest, with completion : @escaping (Result<MovieDetailDataResponse, ErrorResponse>) -> Void) {
        
        NetworkManager.shared.createRequest(urlRequest: request, completion: completion)
    }
    
    private func apiCallHandler(from response: MovieDetailDataResponse) {
        
        dataFormatter.setDetailData(by: response)
        // We let VC know that we have data now.
        viewState?(.done)
        
    }
    
    private lazy var dataListener : (Result<MovieDetailDataResponse, ErrorResponse>) -> Void = { [weak self] result in
        
        switch result {
        case .failure(let error):
            return
        case .success(let response):
            self?.apiCallHandler(from: response)
        }
    }
    
    
}
