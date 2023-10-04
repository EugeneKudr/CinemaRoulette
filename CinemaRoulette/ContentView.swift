//
//  ContentView.swift
//  CinemaRoulette
//
//  Created by Евгений Испольнов on 25.09.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var tabSelected: Tab = .categories
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        ZStack {
            TabView(selection: $tabSelected) {
                NavigationView {
                    List {
                        NavigationLink("Топ 250", destination: FilmsListView(viewModel: FilmsListViewModel()))
                    }
                    .listStyle(.inset)
                    .navigationTitle("Категории")
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbarBackground(.visible, for: .navigationBar)
                }
                .tag(Tab.categories)
                
                CinemaRouletteView()
                    .tag(Tab.roulette)
            }
            VStack {
                Spacer()
                CustomTabBar(selectedTab: $tabSelected)
            }
        }
    }
    
}
