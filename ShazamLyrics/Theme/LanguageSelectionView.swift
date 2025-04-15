//
//  LanguageSelectionView.swift
//  ShazamLyrics
//
//  Created by Manuel Duarte on 10/10/24.
//

import SwiftUI

struct LanguageSelectionView: View {
    @AppStorage("selectedLanguage") private var selectedLanguage = "en"
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Select Language").font(.headline)) {
                    LanguageButton(languageCode: "en", languageName: "English", selectedLanguage: $selectedLanguage, presentationMode: _presentationMode)
                    LanguageButton(languageCode: "es", languageName: "Español", selectedLanguage: $selectedLanguage, presentationMode: _presentationMode)
                }
            }
            .listStyle(InsetGroupedListStyle())
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") {
                        presentationMode.wrappedValue.dismiss()
                    }
                }
            }
        }
    }
}

struct LanguageButton: View {
    let languageCode: String
    let languageName: String
    @Binding var selectedLanguage: String
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        Button(action: {
            changeLanguage(to: languageCode)
            selectedLanguage = languageCode
            presentationMode.wrappedValue.dismiss()
        }) {
            HStack {
                Text(languageName)
                    .foregroundColor(.primary)
                Spacer()
                if selectedLanguage == languageCode {
                    Image(systemName: "checkmark")
                        .foregroundColor(.blue)
                }
            }
            .padding(.vertical, 5)
        }
        .listRowBackground(Color(UIColor.secondarySystemBackground))
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
