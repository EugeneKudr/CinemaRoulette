//
//  RouletteViewModel.swift
//  CinemaRoulette
//
//  Created by Евгений Испольнов on 02.10.2023.
//

import Foundation

final class RouletteViewModel: ObservableObject {
    
    @Published var items: [RouletteItemModel] = []
    
    func addItem(name: String) {
        items.append(RouletteItemModel(filmName: name))
    }
    
}
