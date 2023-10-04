//
//  RouletteViewModel.swift
//  CinemaRoulette
//
//  Created by Евгений Испольнов on 02.10.2023.
//

import Foundation
import Combine
import SimpleRoulette

final class RouletteViewModel: ObservableObject {
    
    @Published var items: [RouletteItemModel] = []
    
    var rouletteModel: RouletteModel {
        let partDatas: [PartData] = items.map { PartData(content: .label($0.filmName), area: .flex(1)) }
        return RouletteModel(parts: partDatas)
    }
    
    func addItem(name: String) {
        items.append(RouletteItemModel(filmName: name))
    }
    
}
