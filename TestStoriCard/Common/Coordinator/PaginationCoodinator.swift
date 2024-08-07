//
//  PaginationCoodinator.swift
//  TestStoriCard
//
//  Created by Nelson Peña Agudelo on 4/08/24.
//

import Foundation

struct PaginationState {
    var isLoading = false
    var isFinished = false
    var isActive = false
}

struct PaginationCoodinator {
    let perPage, firstPage: Int
    var currentPage: Int
    
    init(firstPage: Int = 0, perPage: Int = 49) {
        self.firstPage = firstPage
        self.perPage = perPage
        self.currentPage = firstPage
    }
    
    func nextPage() -> Int {
        return currentPage + 1
    }
    
    mutating func pageLoaded() {
        currentPage = currentPage + 1
    }

    mutating func reset() {
        currentPage = firstPage
    }
}

