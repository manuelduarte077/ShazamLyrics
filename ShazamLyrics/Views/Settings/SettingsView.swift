//
//  SettingsView.swift
//  ShazamLyrics
//
//  Created by Manuel Duarte on 10/9/24.
//

import SwiftUI

struct SettingsView: View {
    // MARK: - PROPERTIES
    @Environment(\.presentationMode) var presentationMode
    @State private var isChangeTheme: Bool = false
    @State private var isChangeLanguage: Bool = false
    
    @State private var selectedTheme: Theme = .default
    @State private var selectedLanguage: Language = .english
    
    
    // MARK: - BODY
    
    var body: some View {
        NavigationView {
            VStack(alignment: .center, spacing: 0) {
                // MARK: - LIST
                Form {
                    HStack(alignment: .center, spacing: 20) {
                        Image(systemName: "music.note.list")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 80, height: 80)
                            .cornerRadius(9)
                            .foregroundStyle(.color1)
                        
                        Text("Shazam LyricsApp is a free app that lets you search for song lyrics using ShazamKit. It's a great way to find out what your favorite songs are about.")
                            .font(.subheadline)
                            .foregroundColor(Color.gray)
                    }
                    
                    // MARK: - SECTION 1
                    Section(header: Text("Follow us on social media")) {
                        FormRowLinkView(icon: "globe", color: Color.pink, text: "Website", link: "https://www.donmanuel.dev/")
                        FormRowLinkView(icon: "link", color: Color.blue, text: "Twitter", link: "https://twitter.com/manuelduarte077")
                    }
                    .padding(.vertical, 3)
                    
                    // MARK: - SECTION 2
                    Section(header: Text("Change theme")) {
                        // Change Theme
                        Button(action: {
                            isChangeTheme.toggle()
                        }) {
                            FormRowStaticView(icon: "sun.max", firstText: "Change theme", secondText: "Light")
                        }
                        .sheet(isPresented: $isChangeTheme) {
                            if #available(iOS 16, *) {
                                ThemeSelectionView(selectedTheme: $selectedTheme)
                                    .presentationDetents([.medium, .fraction(0.7)])
                            } else {
                                ThemeSelectionView(selectedTheme: $selectedTheme)
                            }
                        }
                        .foregroundStyle(.color1)
                        
                        // Change Language
                        Button(action: {
                            isChangeLanguage.toggle()
                        }){
                            FormRowStaticView(icon: "globe", firstText: "Change language", secondText: "Inglés")
                        }
                        .sheet(isPresented: $isChangeLanguage) {
                            if #available(iOS 16, *) {
                                LanguageSelectionView()
                                    .presentationDetents([.medium, .fraction(0.7)])
                            } else {
                                LanguageSelectionView()
                            }
                        }
                        .foregroundStyle(.color1)
                    }
                    .padding(.vertical, 3)
                    
                    // MARK: - SECTION 3
                    Section(header: Text("About the application")) {
                        FormRowStaticView(icon: "gear", firstText: "Application", secondText: "Lyric Finder")
                        FormRowStaticView(icon: "checkmark.seal", firstText: "Compatibility", secondText: "iPhone, iPad")
                        FormRowStaticView(icon: "keyboard", firstText: "Developer", secondText: "Manuel Duarte")
                        FormRowStaticView(icon: "flag", firstText: "Version", secondText: "1.0.0")
                    }
                    .padding(.vertical, 3)
                }
                .listStyle(GroupedListStyle())
                .environment(\.horizontalSizeClass, .regular)
                
                // MARK: - FOOTER
                Text("Copyright © All rights reserved.\nManuel Duarte ♡")
                    .multilineTextAlignment(.center)
                    .font(.footnote)
                    .padding(.top, 6)
                    .padding(.bottom, 8)
                    .foregroundColor(Color.secondary)
            }
            .navigationBarItems(
                trailing: Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "xmark")
                        .foregroundColor(.primary)
                })
            .navigationBarTitle("Settings", displayMode: .inline)
            .background(Color(UIColor.systemBackground).edgesIgnoringSafeArea(.all))
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
    
}

// MARK: - PREVIEW
#Preview {
    SettingsView()
}
