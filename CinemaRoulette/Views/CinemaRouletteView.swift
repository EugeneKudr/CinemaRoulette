//
//  CinemaRouletteView.swift
//  CinemaRoulette
//
//  Created by Евгений Испольнов on 02.10.2023.
//

import SwiftUI
import SimpleRoulette

struct CinemaRouletteView: View {
    
    @EnvironmentObject var viewModel: RouletteViewModel
    
    var body: some View {
        VStack {
            let model = viewModel.rouletteModel
            RouletteView(model: model)
            Button(action: {
                model.start(speed: .random())
            }) {
                Text("Крутить")
                    .font(Font.system(Font.TextStyle.headline))
                    .padding()
            }
            .foregroundColor(Color.blue)
            .padding()
            .background(Material.regularMaterial)
            .cornerRadius(8)
        }
    }
    
}
