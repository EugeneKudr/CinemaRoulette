//
//  CinemaRouletteApp.swift
//  CinemaRoulette
//
//  Created by Евгений Испольнов on 25.09.2023.
//

import SwiftUI

@main
struct CinemaRouletteApp: App {
    
    @StateObject var rouletteViewModel = RouletteViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(rouletteViewModel)
                .preferredColorScheme(.light)
        }
    }
    
}
