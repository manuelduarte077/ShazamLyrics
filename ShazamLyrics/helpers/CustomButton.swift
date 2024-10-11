//
//  CustomButton.swift
//  ShazamLyrics
//
//  Created by Manuel Duarte on 10/10/24.
//

import SwiftUI

struct CustomButton: View {
    var title: String
    var backgroundColor: Color
    var action: () -> Void

    var body: some View {
        Button(action: {
            action()
        }) {
            Text(title)
                .font(.title3)
                .frame(maxWidth: .infinity)
        }
        .buttonStyle(.bordered)
        .controlSize(.large)
        .foregroundColor(.white)
        .background(backgroundColor)
        .cornerRadius(10)
        .padding(.horizontal)
    }
}
#Preview {
    CustomButton(title: "Open", backgroundColor: Color.appleMusicRed, action: {})
}
