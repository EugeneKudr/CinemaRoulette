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
        HStack(spacing: 16) {
            if let urlString = film.posterUrl {
                VStack {
                    AsyncImage(url: URL(string: urlString)) { image in
                        image
                            .resizable()
                            .scaledToFit()
                    } placeholder: {
                        Rectangle()
                            .fill(Color.gray)
                    }
                    .frame(width: 120, height: 180)
                    .cornerRadius(8)
                    Spacer()
                }
            }
            VStack(spacing: 4) {
                if let nameRu = film.nameRu {
                    Text(nameRu)
                        .font(Font.system(.headline))
                        .frame(maxWidth: .infinity, alignment: .topLeading)
                }
                if let nameEn = film.nameEn {
                    Text(nameEn)
                        .font(Font.system(.subheadline))
                        .foregroundColor(Color.gray)
                        .frame(maxWidth: .infinity, alignment: .topLeading)
                }
                if let genres = film.genres, !genres.isEmpty {
                    let genresText: String = {
                        if genres.count == 1 {
                            return "Жанр: " + genres[0].genre
                        } else {
                            return "Жанры: " + genresToString(genres: genres)
                        }
                    }()
                    Text(genresText)
                        .font(Font.system(.subheadline))
                        .foregroundColor(Color.gray)
                        .frame(maxWidth: .infinity, alignment: .topLeading)
                        .padding(EdgeInsets(top: 8, leading: 0, bottom: 0, trailing: 0))
                }
                if let countries = film.countries, !countries.isEmpty {
                    let countriesText: String = {
                        if countries.count == 1 {
                            return "Страна: " + countries[0].country
                        } else {
                            return "Страны: " + countriesToString(countries: countries)
                        }
                    }()
                    Text(countriesText)
                        .font(Font.system(.subheadline))
                        .foregroundColor(Color.gray)
                        .frame(maxWidth: .infinity, alignment: .topLeading)
                        .padding(EdgeInsets(top: 8, leading: 0, bottom: 0, trailing: 0))
                }
                if let filmLength = film.filmLength {
                    Text("Продолжительность: " + filmLength)
                        .font(Font.system(size: 12, weight: .light))
                        .foregroundColor(Color.gray)
                        .frame(maxWidth: .infinity, alignment: .topLeading)
                        .padding(EdgeInsets(top: 8, leading: 0, bottom: 0, trailing: 0))
                }
            }
            .frame(maxHeight: .infinity, alignment: .topLeading)
        }
        .frame(maxWidth: .infinity, alignment: .topLeading)
        .padding(EdgeInsets(top: 48, leading: 32, bottom: 32, trailing: 32))
    }
    
}

extension FilmView {
    
    private func genresToString(genres: [FilmsTopModel.Film.Genre]) -> String {
        return genres.map({ $0.genre }).joined(separator: ", ")
    }
    
    private func countriesToString(countries: [FilmsTopModel.Film.Country]) -> String {
        return countries.map({ $0.country }).joined(separator: ", ")
    }
    
}
