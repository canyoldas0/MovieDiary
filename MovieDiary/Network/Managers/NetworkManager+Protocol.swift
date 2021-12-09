//
//  NetworkManager.swift
//  MovieDiary
//
//  Created by Can Yoldas on 3.12.2021.
//

import Foundation
import Network

protocol NetworkManagerProtocol {
    
    func createRequest<R: Codable>(urlRequest: URLRequest, completion: @escaping (Result<R, ErrorResponse>) -> Void)
}

class NetworkManager: NetworkManagerProtocol {
    
    static let shared = NetworkManager()
    
    private let session: URLSession
    private var jsonDecoder = JSONDecoder()
    
    init() {
        let config = URLSessionConfiguration.default
        config.waitsForConnectivity = true
        config.timeoutIntervalForResource = 350
        config.requestCachePolicy = .reloadIgnoringLocalAndRemoteCacheData
        self.session = URLSession(configuration: config)
    }
    
    func createRequest<R>(urlRequest: URLRequest, completion: @escaping (Result<R, ErrorResponse>) -> Void) where R: Codable {
        
        session.dataTask(with: urlRequest) { (data, urlResponse, error) in
            self.dataTaskHandler(data, urlResponse, error, completion: completion)
        }.resume()
        
    }
    
    private func dataTaskHandler<R: Codable>(_ data: Data?, _ response: URLResponse?, _ error: Error?, completion: @escaping (Result<R, ErrorResponse>) -> Void) {
        
        if error != nil {
            completion(.failure(
                ErrorResponse(
                    serverResponse: ServerResponse(
                        returnMessage: error!.localizedDescription,
                        returnCode: error!._code),
                    apiConnectionErrorType: .serverError(error!._code))))
        }
        
        if let data = data {
            do {
                let decodedData = try jsonDecoder.decode(R.self, from: data)
                completion(.success(decodedData))
            } catch let error {
                completion(.failure(
                    ErrorResponse(serverResponse: ServerResponse(
                        returnMessage: error.localizedDescription,
                        returnCode: error._code),
                                  apiConnectionErrorType: .dataDecodedFailed(error.localizedDescription))))
            }
        }
    }
}
