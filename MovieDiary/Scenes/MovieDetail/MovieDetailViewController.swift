//
//  MovieDetailViewController.swift
//  MovieDiary
//
//  Created by Can Yoldas on 5.12.2021.
//

import UIKit
import BaseModules

class MovieDetailViewController: BaseViewController<MovieDetailViewModel> {
    
    override func prepareViewControllerSetup() {
        viewModel.getDetailData()
    }
}
