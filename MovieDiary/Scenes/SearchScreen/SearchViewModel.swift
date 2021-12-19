//
//  SearchViewModel.swift
//  MovieDiary
//
//  Created by Can Yoldas on 14.12.2021.
//

import Foundation


class SearchViewModel: NSObject {
    
    var searchBarViewState: SearchButtonViewStateBlock?
    private var state: SearchViewStateBlock?
    
    //MARK: - Subscribe States
    public func subscribeSearchBarState(with completion: @escaping SearchButtonViewStateBlock) {
        searchBarViewState = completion
    }
    
    func subscribeState(completion: @escaping SearchViewStateBlock) {
        state = completion
    }

    private func fireApiCall(with request: URLRequest, with completion: @escaping (Result<ItemDataResponse, ErrorResponse>) -> Void) {
  
        NetworkManager.shared.createRequest(urlRequest: request, completion: completion)
    }
    
    private func dataHandler(with response: ItemDataResponse) {
        dataFormatter.paginationData.fetching = false
        dataFormatter.setData(with: response)
        state?(.done)
    }
    
    private func getSearchDataRequest () -> SearchDataRequest {
        return SearchDataRequest()
    }
    
    private lazy var apiCallHandler: (Result<ItemDataResponse, ErrorResponse>) -> Void = { [weak self] result in
//        self?.dataFormatter.paginationData.fetching = false // to show how to handle error .....
        switch result {
            
        case .failure(let error):
            self?.state?(.failure)
        case .success(let data):
            //passing data to dataFormatter
            self?.dataHandler(with: data)
        }
    }

}
