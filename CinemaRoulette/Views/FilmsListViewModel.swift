//
//  FilmsListViewModel.swift
//  CinemaRoulette
//
//  Created by Евгений Испольнов on 27.09.2023.
//

import Foundation
import Combine

final class FilmsListViewModel: ObservableObject, PaginationSubscribing {
    
    private let apiClient = ApiClient()
    
    var offset = 4
    var pagesCount: Int?
    var page = 1
    
    var films: [FilmsTopModel.Film] = []
    
    init() {
        Task(operation: requestData)
    }
    
    @Sendable func requestData() async throws {
        let method = FilmsTopMethod(page: page)
        let response: FilmsTopModel = try await apiClient.request(method)
        page += 1
        films += response.films
        pagesCount = response.pagesCount
        DispatchQueue.main.async { [weak self] in
            self?.objectWillChange.send()
        }
    }
    
}
