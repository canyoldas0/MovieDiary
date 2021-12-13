//
//  PaginationInfo.swift
//  MovieDiary
//
//  Created by Can Yoldas on 14.12.2021.
//

import Foundation

struct PaginationInfo {
    var resultCount: Int = 0
    var limit: Int = 20
    var offset: Int = 0
    var page: Int = 1
    var fetching: Bool = false
    
    func checkLoadingMore() -> Bool {
        return limit <= resultCount && !fetching
    }
    
    mutating func nextOffset() {
        fetching = true
        offset += limit
        page += 1
    }
    
    mutating func reset() {
        
    resultCount = 0
    limit = 20
    offset = 0
    page = 1
    }
}
