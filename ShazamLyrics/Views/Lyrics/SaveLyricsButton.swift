//
//  SaveLyricsButton.swift
//  ShazamLyrics
//
//  Created by Manuel Duarte on 10/10/24.
//

import SwiftUI

struct SaveLyricsButton: View {
    
    @State private var isLyricsSaved: Bool = false // Estado para saber si la letra está guardada
    @State private var showAlert: Bool = false // Controla la visibilidad de la alerta
    
    var body: some View {
        VStack {
            // Botón para guardar/remover letra
            Button {
                // Mostrar alerta cuando se presiona el botón
                showAlert = true
            } label: {
                HStack {
                    Image(systemName: isLyricsSaved ? "trash.circle.fill" : "heart.circle")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                    Text(isLyricsSaved ? "Remove" : "Save")
                        .font(.title2.bold())
                        .foregroundColor(.white)
                }
                .padding(10)
                .frame(maxWidth: .infinity)
                .background(isLyricsSaved ? Color.red : Color.blue)
                .cornerRadius(10)
                .padding(.horizontal)
            }
            .alert(isPresented: $showAlert) {
                Alert(
                    title: Text(isLyricsSaved ? "Remove Lyrics" : "Save Lyrics"),
                    message: Text(isLyricsSaved ? "Do you want to remove this lyrics?" : "Do you want to save this lyrics?"),
                    primaryButton: .destructive(Text(isLyricsSaved ? "Remove" : "Save")) {
                        isLyricsSaved.toggle() // Cambia el estado de guardado
                    },
                    secondaryButton: .cancel()
                )
            }
        }
    }
}

#Preview {
    SaveLyricsButton()
}
