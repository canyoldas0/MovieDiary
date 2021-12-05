//
//  MovieDetailViewBuilder.swift
//  MovieDiary
//
//  Created by Can Yoldas on 5.12.2021.
//

import UIKit

class MovieDetailViewBuilder {
    
    class func build(with data: MovieDetailDataRequest) -> MovieDetailViewController {
        
        let dataFormatter = MovieDetailDataFormatter()
        let viewModel = MovieDetailViewModel(formatter: dataFormatter, requestData: data)
        let viewController = MovieDetailViewController(viewModel: viewModel)
        return viewController
    }
}

