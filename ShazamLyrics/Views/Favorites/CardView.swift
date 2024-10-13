//
//  CardView.swift
//  ShazamLyrics
//
//  Created by Manuel Duarte on 7/10/24.
//

import SwiftUI

struct CardView: View {
    
    var item: Int
    var isSelected: Bool
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 8)
                .fill(LinearGradient(gradient: Gradient(colors: [Color(.systemBlue).opacity(0.3), Color(.systemTeal).opacity(0.5)]), startPoint: .topLeading, endPoint: .bottomTrailing))
                .shadow(radius: 10)
            
            HStack {
                VStack(alignment: .leading, spacing: 8) {
                    // Título del ítem
                    Text("Letra guardada \(item)")
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                    
                    // Estado: Par o Impar
                    Text(item.isMultiple(of: 2) ? "Even" : "Odd")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                Spacer()
                
                // Icono de favorito
                Image(systemName: isSelected ? "star.fill" : "star")
                    .font(.title)
                    .foregroundColor(isSelected ? .yellow : .gray)
                    .scaleEffect(isSelected ? 1.3 : 1.0)
            }
            .padding(20)
        }
        .padding(.horizontal)
        .frame(height: 80)
        .scaleEffect(isSelected ? 1.05 : 1.0)
        .animation(.spring(), value: isSelected)
    }
}


#Preview {
    CardView(item: 1, isSelected: false)
}
