//
//  LanguageSelectionView.swift
//  ShazamLyrics
//
//  Created by Manuel Duarte on 10/10/24.
//

import SwiftUI

struct LanguageSelectionView: View {
    @AppStorage("selectedLanguage") private var selectedLanguage = "en"

    var body: some View {
        VStack {
            Text("Select Language")
                .font(.headline)
                .padding()

            // Botón para cambiar a Inglés
            Button(action: {
                changeLanguage(to: "en")
            }) {
                Text("English")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }

            // Botón para cambiar a Español
            Button(action: {
                changeLanguage(to: "es")
            }) {
                Text("Español")
                    .padding()
                    .background(Color.red)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
    }

    func changeLanguage(to language: String) {
        UserDefaults.standard.set([language], forKey: "AppleLanguages")
        UserDefaults.standard.synchronize()
        
        if let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
            scene.windows.first?.rootViewController = UIHostingController(rootView: ContentView())
            scene.windows.first?.makeKeyAndVisible()
        }
    }
}

#Preview {
    LanguageSelectionView()
}
