//
//  FilmsTopMethod.swift
//  CinemaRoulette
//
//  Created by Евгений Испольнов on 28.09.2023.
//

import Foundation

final class FilmsTopMethod: ApiMethodDescribing {
    
    var version: String?
    var method: String
    var parameters: String
    
    init(page: Int) {
        self.parameters = "?type=TOP_250_BEST_FILMS&page=\(page)"
        self.version = "2.2"
        self.method = "films/top" + parameters
    }
    
}
