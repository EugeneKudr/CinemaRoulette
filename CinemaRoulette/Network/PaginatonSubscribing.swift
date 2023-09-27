//
//  PaginatonSubscribing.swift
//  CinemaRoulette
//
//  Created by Евгений Испольнов on 28.09.2023.
//

import Foundation
import Combine

public protocol PaginationSubscribing {
    
    var offset: Int { get }
    var pagesCount: Int? { get }
    var page: Int { get set }
    
    @Sendable func requestData() async throws
    
}

extension PaginationSubscribing {
    
    func requestMoreItemsIfNeeded(itemsCount: Int, index: Int) {
        if thresholdMeet(itemsCount, index) && moreItemsRemaining() {
            Task(operation: requestData)
        }
    }
    
    private func thresholdMeet(_ itemsLoadedCount: Int, _ index: Int) -> Bool {
        return (itemsLoadedCount - index) == offset
    }
    
    private func moreItemsRemaining() -> Bool {
        guard let pagesCount else { return false }
        return page < pagesCount
    }
    
}
