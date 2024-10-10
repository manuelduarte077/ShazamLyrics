//
//  RecordingButton.swift
//  ShazamLyrics
//
//  Created by Manuel Duarte on 8/10/24.
//

import SwiftUI

struct RecordingButton: View {
    @State private var animateRecording: Bool = false
    @ObservedObject var shazam: ShazamViewModel
    
    var body: some View {
        Button {
            shazam.listnenMusic()
        } label: {
            Image(systemName: shazam.isRecording ? "stop" : "mic.fill")
                .font(.system(size: 35).bold())
                .foregroundColor(.white)
                .padding(30)
                .background(Color.cyan, in: Circle())
                .scaleEffect(shazam.isRecording && animateRecording ? 1.2 : 1.0)
                .shadow(color: .cyan.opacity(0.7), radius: shazam.isRecording ? 10 : 0)
        }
        .onAppear {
            if shazam.isRecording {
                startPulsingAnimation()
            }
        }
        .onChange(of: shazam.isRecording) { isRecording in
            if isRecording {
                startPulsingAnimation()
            } else {
                animateRecording = false
            }
        }
    }
    
    // Función que maneja la animación de pulsación
    func startPulsingAnimation() {
        withAnimation(Animation.easeInOut(duration: 0.8).repeatForever(autoreverses: true)) {
            animateRecording = true
        }
    }
}

#Preview {
    RecordingButton(shazam: ShazamViewModel())
}
