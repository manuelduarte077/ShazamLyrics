//
//  LyricsService.swift
//  ShazamLyrics
//
//  Created by Manuel Duarte on 6/10/24.
//

import Foundation

struct LyricService {
    
    func fetchLyrics(artist: String, title: String) async throws -> LyricsModel {
        let urlStr = "https://api.lyrics.ovh/v1/\(artist)/\(title)"
        guard let url = URL(string: urlStr.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "") else {
            throw URLError(.badURL)
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let lyricsData = try JSONDecoder().decode(LyricsModel.self, from: data)
        
        return lyricsData
    }
}
