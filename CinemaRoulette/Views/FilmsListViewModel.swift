//
//  FilmsListViewModel.swift
//  CinemaRoulette
//
//  Created by Евгений Испольнов on 27.09.2023.
//

import Foundation
import Combine

final class FilmsListViewModel: ObservableObject {
    
    private let apiClient = ApiClient()
    
    private let offset = 1
    private var pagesCount: Int?
    private var page = 1
    var dataIsLoading = false
    
    var films: [FilmsTopModel.Film] = []
        
    init() {
        Task(operation: requestData)
    }
    
    @Sendable func requestData() async throws {
        let method = FilmsTopMethod(page: page)
        dataIsLoading = true
        let response: FilmsTopModel = try await apiClient.request(method)
        dataIsLoading = false
        films += response.films
        pagesCount = response.pagesCount
        DispatchQueue.main.async { [weak self] in
            self?.objectWillChange.send()
        }
    }
    
}

/// Pagination
extension FilmsListViewModel {
    
    func requestMoreItemsIfNeeded(index: Int) {
        if thresholdMeet(films.count, index) && moreItemsRemaining() {
            page += 1
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
