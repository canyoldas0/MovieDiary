//
//  NetworkManager.swift
//  MovieDiary
//
//  Created by Can Yoldas on 3.12.2021.
//

import Foundation
import Network

protocol NetworkManagerProtocol {
    
    func createRequest<R: Codable>(urlRequest: URLRequest, completion: @escaping (Result<R,Error>) -> Void)
}

public class NetworkManager: NetworkManagerProtocol {
    
    public static let shared = NetworkManager()
    
    private let session: URLSession
    private var jsonDecoder = JSONDecoder()
    
    init() {
        let config = URLSessionConfiguration.default
        config.waitsForConnectivity = true
        config.timeoutIntervalForResource = 350
        config.requestCachePolicy = .reloadIgnoringLocalAndRemoteCacheData
        self.session = URLSession(configuration: config)
    }
    
    func createRequest<R>(urlRequest: URLRequest, completion: @escaping (Result<R, Error>) -> Void) where R : Decodable, R : Encodable {
        
        session.dataTask(with: urlRequest) { (data, urlResponse, error) in
            self.dataTaskHandler(data, urlResponse, error, completion: completion)
        }.resume()
    
    }
    
    private func dataTaskHandler<R: Codable>(_ data: Data?, _ response: URLResponse?, _ error: Error?, completion: @escaping (Result<R, Error>) -> Void) {
        
        if let e = error {
            // Request Error
            completion(.failure(e))
        }
        
        if let data = data {
            do {
                let decodedData = try jsonDecoder.decode(R.self, from: data)
                completion(.success(decodedData))
            } catch let error {
                completion(.failure(error))
            }
        }
    }
}
