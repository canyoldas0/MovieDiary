//
//  MainViewModel.swift
//  MovieDiary
//
//  Created by Can Yoldas on 26.11.2021.
//

import Foundation

class MainViewModel {
    
    var dataFormatter: MainViewDataFormatterProtocol!
    
    init(dataFormatter: MainViewDataFormatterProtocol) {
        self.dataFormatter = dataFormatter
    }
    
}
