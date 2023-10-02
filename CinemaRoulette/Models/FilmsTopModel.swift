//
//  FilmsTopModel.swift
//  CinemaRoulette
//
//  Created by Евгений Испольнов on 26.09.2023.
//

import Foundation

struct FilmsTopModel: Decodable {
    
    let pagesCount: Int
    let films: [Film]
    
    struct Film: Decodable, Identifiable {
        
        let filmId: Int
        let nameEn: String?
        let nameRu: String?
        let rating: String?
        let posterUrl: String?
        let posterUrlPreview: String?
        let filmLength: String?
        let genres: [Genre]?
        let countries: [Country]?
        
        var id: Int {
            return filmId
        }
        
        struct Genre: Decodable {
            let genre: String
        }
        
        struct Country: Decodable {
            let country: String
        }
        
    }
    
}
