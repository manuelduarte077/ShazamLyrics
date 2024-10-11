//
//  ShazamView.swift
//  ShazamLyrics
//
//  Created by Manuel Duarte on 11/9/24.
//


import SwiftUI

struct ShazamView: View {
    
    @StateObject private var shazam = ShazamViewModel()
    @State private var isShowingSettings: Bool = false
    @State private var isShowingLyricsSheet: Bool = false
    
    var body: some View {
        ZStack {
            NavigationView {
                VStack(alignment: .center){
                    RecordingButton(shazam: shazam)
                }
                .navigationTitle("Lyrics")
            }
            
            
            if let track = shazam.matchedTrack {
                
                ZStack {
                    // Background Blurred Image...
                    AsyncImage (url: track.artwork) { phase in
                        
                        if let image = phase.image {
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                        }
                        else {
                            Color.white
                        }
                    }
                    .overlay(.ultraThinMaterial)
                    .frame(width: getRect().width)
                    
                    // Track info...
                    VStack (spacing: 15) {
                        Spacer()
                        AsyncImage (url: track.artwork) { phase in
                            
                            if let image = phase.image {
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: getRect().width - 100, height: 300)
                                    .cornerRadius(12)
                            }
                            else {
                                ProgressView()
                            }
                        }
                        .frame(width: getRect().width - 100, height: 300)
                        
                        Text(track.title)
                            .font(.title2.bold())
                        
                        Text("Artist: \(track.artist)")
                            .padding(.horizontal)
                        
                        VStack (alignment: .leading, spacing: 6) {
                            Text("Genres")
                                .font(.body.bold())
                                .padding(.leading)
                            
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack (spacing: 10) {
                                    ForEach(track.genres, id: \.self) { genre in
                                        Button {
                                            //
                                        } label: {
                                            Text(genre)
                                                .font(.caption)
                                        }
                                        .buttonStyle(.bordered)
                                        .controlSize(.small)
                                        .tint(.black)
                                    }
                                }
                                .padding(.horizontal)
                            }
                        }
                        Spacer()
                        // Apple Music Link...
                        Link(destination: track.appleMusicURL) {
                            Text("Play in Apple Music")
                                .font(.title3)
                                .frame(maxWidth: .infinity)
                        }
                        .buttonStyle(.bordered)
                        .controlSize(.large)
                        .foregroundColor(.white)
                        .background(Color.appleMusicRed)
                        .cornerRadius(10)
                        .padding(.horizontal)
                        
                        /// Ver letra
                        CustomButton(
                            title: "See lyrics detail",
                            backgroundColor: Color.customGreen
                        ) {
                            isShowingLyricsSheet.toggle()
                        }
                        .sheet(isPresented: $isShowingLyricsSheet) {
                            LyricsView(artist: shazam.matchedTrack.artist, title: shazam.matchedTrack.title)
                        }
                        Spacer()
                    }
                    
                    // Close Button
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .overlay(
                        Button (action: {
                            // Resetting View...
                            shazam.matchedTrack = nil
                            shazam.stopRecording()
                        }, label: {
                            Image(systemName: "xmark")
                                .font(.caption)
                                .padding(10)
                                .background(Color.white, in: Circle())
                                .foregroundStyle(.black)
                        })
                        .padding(10)
                        ,alignment: .topTrailing
                    )
                }
            }
        }
        .alert(shazam.errorMsg, isPresented: $shazam.showError) {
            Button("Cancel", role: .cancel) {
                
            }
        }
    }
}

#Preview {
    ShazamView()
}

extension View {
    func getRect () -> CGRect {
        return UIScreen.main.bounds
    }
}
