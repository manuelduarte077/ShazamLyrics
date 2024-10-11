//
//  LyricsViewModel.swift
//  ShazamLyrics
//
//  Created by Manuel Duarte on 6/10/24.
//

import Foundation

@MainActor
class LyricsViewModel : ObservableObject {
    
    @Published var lyricModel = LyricsModel(lyrics: "", error: "")
    @Published var isLoading: Bool = false
    private let lyricService = LyricService()  // Instanciamos el servicio
    
    func fetchLyrics(artist: String, title: String) async {
        isLoading = true
        defer { isLoading = false }
        
        do {
            // Usamos el servicio para obtener las letras
            let lyrics = try await lyricService.fetchLyrics(artist: artist, title: title)
            self.lyricModel = lyrics
        } catch {
            print("Error fetching lyrics:", error.localizedDescription)
            self.lyricModel = LyricsModel(lyrics: "", error: error.localizedDescription)
        }
    }
}
