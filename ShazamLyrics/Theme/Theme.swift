//
//  Theme.swift
//  ShazamLyrics
//
//  Created by Manuel Duarte on 10/10/24.
//

import SwiftUI

enum Theme: String, CaseIterable {
    case `default` = "Default"
    case light = "Light"
    case dark = "Dark"
    
    var colorScheme: ColorScheme? {
        switch self {
        case .default:
            return nil
        case .light:
            return .light
        case .dark:
            return .dark
        }
    }
}

enum Language: String, CaseIterable {
    case `default` = "Default"
    case english = "English"
    case spanish = "Spanish"
    
    var locale: Locale? {
        switch self {
        case .default:
            return nil
        case .english:
            return Locale(identifier: "en_US_POSIX")
        case .spanish:
            return Locale(identifier: "es_ES_POSIX")
        }
    }
}
