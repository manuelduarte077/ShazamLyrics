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
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        
        NavigationView{
            ScrollView(.vertical, showsIndicators: false){
                VStack(alignment: .center, spacing: 20) {
                    // HEADER
                    ZStack(alignment: .topTrailing) {
                        ShazamHeaderView()
                        
                        Button(action: {
                            withAnimation {
                                dismiss()
                            }
                        }) {
                            Image(systemName: "xmark")
                                .font(.title2)
                                .foregroundColor(.primary)
                                .padding(14)
                                .background(Color.white.opacity(0.7))
                                .clipShape(Circle())
                                .shadow(radius: 4)
                        }
                        .padding([.top, .trailing], 20)
                    }
                    
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
                        VStack (alignment: .center, spacing: 16) {
                            if lyrics.isLoading{
                                ProgressView("Loading lyrics...")
                                    .font(.headline)
                                    .padding()
                            } else {
                                if let lyricsText = lyrics.lyricModel.lyrics, !lyricsText.isEmpty {
                                    Text(lyricsText)
                                        .font(.headline)
                                        .foregroundColor(.secondary)
                                        .padding()
                                } else {
                                    Text("No lyrics found")
                                        .font(.headline)
                                        .foregroundColor(.secondary)
                                        .padding()
                                }
                            }
                        }
                        .frame(maxWidth: .infinity)
                        
                    }
                    .padding(.horizontal, 16)
                    
                    // Save lyric
                    if let lyricsText = lyrics.lyricModel.lyrics, !lyricsText.isEmpty {
                        SaveLyricsButton()
                    }
                }
                .navigationBarTitle(title, displayMode: .inline)
                .navigationBarHidden(true)
                .task {
                    await lyrics.fetchLyrics(artist: artist, title: title)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color(UIColor.systemBackground))
            }//: Scroll
            .edgesIgnoringSafeArea(.top)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}


#Preview {
    LyricsView(artist: "Chayanne", title: "Yo Te Amo")
    
}

