//
//  ContentView.swift
//  CinemaRoulette
//
//  Created by Евгений Испольнов on 25.09.2023.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        TabView {
            NavigationView {
                List {
                    NavigationLink("Топ 250", destination: FilmsListView(viewModel: FilmsListViewModel()))
                }
                .listStyle(.inset)
                .navigationTitle("Категории")
                .navigationBarTitleDisplayMode(.inline)
                .toolbarBackground(.visible, for: .navigationBar)
            }
            .tabItem {
                Label("Фильмы", systemImage: "list.dash")
            }
            .toolbarBackground(.visible, for: .tabBar)
            
            VStack {
                
            }
            .tabItem {
                Label("Рулетка", systemImage: "arrow.triangle.2.circlepath")
            }
        }
    }
    
}
