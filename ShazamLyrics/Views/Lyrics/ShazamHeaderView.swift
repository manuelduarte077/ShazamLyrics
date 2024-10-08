//
//  FruitHeaderView.swift
//  ShazamLyrics
//
//  Created by Manuel Duarte on 11/9/24.
//

import SwiftUI

struct ShazamHeaderView: View {
    
    @State private var isAnimatingImage: Bool = false
    
    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [Color(.systemGray6), Color(.systemTeal).opacity(0.3)]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
            
            Image(systemName: "music.note.list")
                .resizable()
                .scaledToFit()
                .shadow(color: Color.black.opacity(0.1), radius: 6, x: 4, y: 6)
                .scaleEffect(isAnimatingImage ? 1.0 : 0.5)
                .animation(.easeOut(duration: 0.7), value: isAnimatingImage)
                .frame(height: 180)
        }
        .frame(height: 240)
        .onAppear {
            withAnimation {
                isAnimatingImage = true
            }
        }
    }
}

#Preview {
    ShazamHeaderView()
}
