//
//  RouletteView.swift
//  CinemaRoulette
//
//  Created by Евгений Испольнов on 02.10.2023.
//

import SwiftUI

struct RouletteView: View {
    
    @EnvironmentObject var viewModel: RouletteViewModel
    
    var body: some View {
        Text(String(viewModel.items.count))
    }
    
}
