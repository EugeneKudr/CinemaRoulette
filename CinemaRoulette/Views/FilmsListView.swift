//
//  FilmsListView.swift
//  CinemaRoulette
//
//  Created by Евгений Испольнов on 27.09.2023.
//

import SwiftUI

struct FilmsListView: View {
    
    @ObservedObject var viewModel: FilmsListViewModel
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.films.enumerated().map({ $0 }), id: \.element.filmId) { index, film in
                    HStack {
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
                    }
                    .onAppear { viewModel.requestMoreItemsIfNeeded(itemsCount: viewModel.films.count, index: index) }
                }
            }
            .listStyle(.inset)
        }
        .navigationTitle("Топ 250")
    }
        
    
}
