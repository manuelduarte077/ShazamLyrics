//
//  RecordingButton.swift
//  ShazamLyrics
//
//  Created by Manuel Duarte on 8/10/24.
//

import SwiftUI

struct RecordingButton: View {
    @State private var animateRecording: Bool = false
    @State private var animateGlow: Bool = false
    @ObservedObject var shazam: ShazamViewModel

    var body: some View {
        ZStack {
            // Círculo de resplandor animado
            if shazam.isRecording {
                Circle()
                    .stroke(Color.cyan.opacity(0.7), lineWidth: 20)
                    .frame(width: 200, height: 200)
                    .scaleEffect(animateGlow ? 1.2 : 0.8)
                    .opacity(animateGlow ? 0 : 1)
                    .animation(Animation.easeInOut(duration: 1.5).repeatForever(autoreverses: true), value: animateGlow)
                    .onAppear {
                        animateGlow = true
                    }
            }

            // Botón de grabación con animación de escala
            Button {
                shazam.listnenMusic()
            } label: {
                Image(systemName: shazam.isRecording ? "stop.circle.fill" : "mic.fill")
                    .font(.system(size: 55).bold())
                    .foregroundColor(.white)
                    .padding(30)
                    .background(Color.cyan, in: Circle())
                    .scaleEffect(animateRecording ? 1.1 : 1.0) // Efecto de pulsación en el botón
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
                    animateGlow = false // Detenemos la animación del resplandor
                }
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
    let shazam = ShazamViewModel()
    RecordingButton(shazam: shazam)
}
