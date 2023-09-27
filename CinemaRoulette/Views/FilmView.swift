//
//  FilmView.swift
//  CinemaRoulette
//
//  Created by Евгений Испольнов on 27.09.2023.
//

import SwiftUI

struct FilmView: View {
    
    let film: FilmsTopModel.Film
    
    var body: some View {
        VStack {
            if let urlString = film.posterUrlPreview {
                AsyncImage(url: URL(string: urlString)) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 48, height: 72)
                } placeholder: {
                    Rectangle()
                        .fill(Color.gray)
                        .frame(width: 48, height: 72)
                }

            }
            Text(film.nameRu ?? "")
        }
    }
    
}
