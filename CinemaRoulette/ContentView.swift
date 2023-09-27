//
//  ContentView.swift
//  CinemaRoulette
//
//  Created by Евгений Испольнов on 25.09.2023.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        NavigationView {
            List {
                NavigationLink("Movies list", destination: FilmsListView(viewModel: FilmsListViewModel()))
            }
        }
    }
    
}
