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
            LinearGradient(gradient: Gradient(colors: [Color(.color1), Color(.color2)]), startPoint: .topLeading, endPoint: .bottomTrailing)
          
          Image(systemName: "music.note.list")
            .resizable()
            .scaledToFit()
            .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 8, x: 6, y: 8)
            .padding(.horizontal, 20)
            .scaleEffect(isAnimatingImage ? 1.0 : 0.6)
        } //: ZSTACK
   
        .frame(height: 440)
        .onAppear() {
          withAnimation(.easeOut(duration: 0.5)) {
            isAnimatingImage = true
          }
        }
    }
}

#Preview {
    ShazamHeaderView()
}
