//
//  SettingsView.swift
//  ShazamLyrics
//
//  Created by Manuel Duarte on 10/9/24.
//

import SwiftUI

struct SettingsView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 20) {
                    // MARK: - SECTION 1
                    
                    GroupBox(
                        label:
                            SettingsLabelView(labelText: "ShazamLyricsApp", labelImage: "info.circle")
                    ) {
                        Divider().padding(.vertical, 4)
                        
                        HStack(alignment: .center, spacing: 20) {
                            Image(systemName: "music.note.list")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 80, height: 80)
                                .cornerRadius(9)
                            
                            Text("Shazam LyricsApp is a free app that lets you search for song lyrics using ShazamKit. It's a great way to find out what your favorite songs are about.")
                                .font(.subheadline)
                        }
                    }
                    
                    // Favorites
                    GroupBox(
                        label:
                            SettingsLabelView(labelText: "Favorites", labelImage: "star")
                    ) {
                        NavigationLink(destination: FavoritesView()) {
                            HStack {
                                Text("Lyrics")
                                Spacer()
                                
                                Image(systemName: "music.note.list")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 20, height: 20)
                                    .foregroundColor(.yellow)
                            }
                        }
                        .navigationTitle("Favorites")
                    }
                    
                    ///
                    GroupBox(
                        label:
                            SettingsLabelView(labelText: "Application", labelImage: "apps.iphone")
                    ) {
                        SettingsRowView(name: "Developer", content: "Manuel Duarte")
                        SettingsRowView(name: "Compatibility", content: "iOS 18")
                        SettingsRowView(name: "Website", linkLabel: "Don Manuel", linkDestination: "donmanuel.dev")
                        SettingsRowView(name: "Twitter", linkLabel: "@manuelduarte077", linkDestination: "twitter.com/manuelduarte077")
                        SettingsRowView(name: "Version", content: "1.1.0")
                    }
                }
                .navigationBarTitle(Text("Settings"), displayMode: .large)
                .navigationBarItems(
                    trailing:
                        Button(action: {
                            presentationMode.wrappedValue.dismiss()
                        }) {
                            Image(systemName: "xmark")
                        }
                )
                .padding()
            } //: Scroll
        } //: Navigation
    }
}


#Preview {
    SettingsView()
}
