//
//  FilmsListViewModel.swift
//  CinemaRoulette
//
//  Created by Евгений Испольнов on 27.09.2023.
//

import Foundation
import Combine

final class FilmsListViewModel: ObservableObject {
    
    let apiClient = ApiClient()
    
    var films: [FilmsTopModel.Film] = []
    
    init() {
        Task(operation: requestData)
    }
    
    @Sendable func requestData() async throws {
        let url = "https://kinopoiskapiunofficial.tech/api/v2.2/films/top?type=TOP_250_BEST_FILMS&page=1"
        let response: FilmsTopModel = try await apiClient.request(urlString: url)
        films = response.films
        DispatchQueue.main.async { [weak self] in
            self?.objectWillChange.send()
        }
    }
    
}
