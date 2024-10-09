//
//  Track.swift
//  ShazamLyrics
//
//  Created by Manuel Duarte on 8/10/24.
//

import Foundation

struct Track: Identifiable {
    var id = UUID().uuidString
    
    // Track info...
    var title: String
    var artist: String
    var artwork: URL
    var genres: [String]
    var appleMusicURL: URL
}
