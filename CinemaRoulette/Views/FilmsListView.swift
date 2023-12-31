//
//  FilmsListView.swift
//  CinemaRoulette
//
//  Created by Евгений Испольнов on 27.09.2023.
//

import SwiftUI

struct FilmsListView: View {
    
    @ObservedObject var viewModel: FilmsListViewModel
    @EnvironmentObject var rouletteViewModel: RouletteViewModel
    
    @State var selectedFilm: FilmsTopModel.Film?
    
    var body: some View {
        List {
            ForEach(viewModel.films.enumerated().map({ $0 }), id: \.element.id) { index, film in
                Button(action: {
                    if let filmName = film.nameRu {
                        rouletteViewModel.addItem(name: filmName)
                    }
                }, label: {
                    FilmListItemView(film: film, selectedFilm: $selectedFilm)
                        .onAppear { viewModel.requestMoreItemsIfNeeded(itemsCount: viewModel.films.count, index: index) }
                })
            }
        }
        .listStyle(.plain)
        .navigationTitle("Топ 250")
        .navigationBarTitleDisplayMode(.inline)
        .toolbarBackground(.visible, for: .navigationBar)
        .sheet(item: $selectedFilm) { film in
            FilmView(film: film)
                .presentationDetents([.height(300), .medium, .large])
                .presentationDragIndicator(.automatic)
        }
    }
    
}

extension FilmsListView {
    
    private struct FilmListItemView: View {
        
        let film: FilmsTopModel.Film
        
        @Binding var selectedFilm: FilmsTopModel.Film?
        
        var body: some View {
            HStack {
                if let urlString = film.posterUrlPreview {
                    AsyncImage(url: URL(string: urlString)) { image in
                        image
                            .resizable()
                            .scaledToFit()
                    } placeholder: {
                        Rectangle()
                            .fill(Color.gray)
                    }
                    .frame(width: 48, height: 72)
                }
                VStack(spacing: 8) {
                    Text(film.nameRu ?? "")
                        .font(Font.system(size: 14, weight: .medium))
                        .foregroundColor(Color.black)
                        .frame(maxWidth: .infinity, alignment: .topLeading)
                    Text(film.nameEn ?? "")
                        .font(Font.system(size: 12, weight: .light))
                        .foregroundColor(Color.gray)
                        .frame(maxWidth: .infinity, alignment: .topLeading)
                }
                Spacer()
                Image(systemName: "star")
                Text(film.rating ?? "")
                    .font(Font.system(size: 14, weight: .light))
                    .foregroundColor(Color.gray)
                Image(systemName: "info.circle")
                    .padding(20)
                    .onTapGesture {
                        selectedFilm = film
                    }
            }
        }
        
    }
    
}
