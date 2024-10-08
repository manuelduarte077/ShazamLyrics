//
//  LyricsView.swift
//  ShazamLyrics
//
//  Created by Manuel Duarte on 7/10/24.
//

import SwiftUI

struct LyricsView: View {
    
    @StateObject private var lyrics = LyricsViewModel()
    var artist: String
    var title: String
    
    var body: some View {
        
        NavigationView{
            ScrollView(.vertical, showsIndicators: false){
                VStack(alignment: .center, spacing: 20) {
                    // HEADER
                    ShazamHeaderView()
                    
                    VStack(alignment: .leading, spacing: 16) {
                        // TITLE - Artista
                        Text(artist)
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.primary)
                        
                        // SUBHEADLINE - Título de la canción
                        Text("\(title)".uppercased())
                            .font(.title2)
                            .fontWeight(.semibold)
                            .foregroundColor(.secondary)
                        
                        Divider()
                        
                        // LYRIC - Letra de la canción
                        if let lyricsText = lyrics.lyricModel.lyrics, !lyricsText.isEmpty {
                            Text(lyricsText)
                                .font(.body)
                                .multilineTextAlignment(.leading)
                                .lineSpacing(8)
                                .padding(.top, 10)
                        } else {
                            VStack (alignment: .center) {
                                ProgressView()
                                Text("No se encontró la letra para **\(title)**.")
                                    .font(.body)
                                    .foregroundColor(.red)
                            }
                        }
                    }
                    .padding(.horizontal, 16)
                    .frame(maxWidth: 600)
                }
                .navigationBarTitle(title, displayMode: .inline)
                .navigationBarHidden(true)
                .task {
                    await lyrics.fetchLyrics(artist: artist, title: title)
                }
            }//: Scroll
            .edgesIgnoringSafeArea(.top)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}


#Preview {
    LyricsView(artist: "Chayanne", title: "Yo Te Amo")
}

