//
//  ThemeSelectionView.swift
//  ShazamLyrics
//
//  Created by Manuel Duarte on 10/10/24.
//

import SwiftUI

struct ThemeSelectionView: View {
    @Binding var selectedTheme: Theme
    
    var body: some View {
        VStack {
            Text("Select Theme")
                .font(.headline)
                .padding()
            
            // Opciones de tema
            ForEach(Theme.allCases, id: \.self) { theme in
                Button(action: {
                    selectedTheme = theme
                }) {
                    HStack {
                        Text(theme.rawValue)
                            .foregroundColor(.primary)
                        Spacer()
                        if selectedTheme == theme {
                            Image(systemName: "checkmark")
                                .foregroundColor(.blue)
                        }
                    }
                    .padding()
                    .background(Color(UIColor.systemGray6))
                    .cornerRadius(10)
                }
                .padding(.horizontal)
            }
            
            Spacer()
        }
        .padding(.top, 20)
    }
}
