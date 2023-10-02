//
//  CustomTabBar.swift
//  CinemaRoulette
//
//  Created by Евгений Испольнов on 02.10.2023.
//

import SwiftUI

struct CustomTabBar: View {
    
    @EnvironmentObject var rouletteViewModel: RouletteViewModel
    
    @Binding var selectedTab: Tab
    
    var body: some View {
        HStack {
            ForEach(Tab.allCases, id: \.rawValue) { tab in
                Spacer()
                Image(systemName: tab.imageName)
                    .scaleEffect(tab == selectedTab ? 1.25 : 1.0)
                    .foregroundColor(tab == selectedTab ? Color.blue : Color.gray)
                    .font(Font.system(size: 20))
                    .onTapGesture {
                        withAnimation(.easeIn(duration: 0.1)) {
                            selectedTab = tab
                        }
                    }
                    .overlay {
                        if tab.hasBadge, rouletteViewModel.items.count > 0 {
                            Circle()
                                .fill(Color.red)
                                .frame(width: 20, height: 20)
                                .overlay {
                                    Text(String(rouletteViewModel.items.count))
                                        .foregroundColor(Color.white)
                                }
                                .padding(EdgeInsets(top: 0, leading: 30, bottom: 30, trailing: 0))
                        }
                    }
                Spacer()
            }
        }
        .frame(height: 60)
        .background(Material.thinMaterial)
        .cornerRadius(20)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.gray, lineWidth: 0.5)
        )
        .padding()
    }
    
}


enum Tab: String, CaseIterable {
    
    case categories
    case roulette
    
    var imageName: String {
        switch self {
        case .categories:
            return "list.dash"
        case .roulette:
            return "arrow.triangle.2.circlepath"
        }
    }
    
    // Только у одной кнопки может быть badge
    var hasBadge: Bool {
        switch self {
        case .categories:
            return false
        case .roulette:
            return true
        }
    }
    
}
