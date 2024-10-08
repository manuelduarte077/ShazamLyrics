//
//  SettingsLabelView.swift
//  ShazamLyrics
//
//  Created by Manuel Duarte on 10/9/24.
//

import SwiftUI

struct SettingsLabelView: View {
      // MARK: - PROPERTIES
      
      var labelText: String
      var labelImage: String

      // MARK: - BODY

      var body: some View {
        HStack {
          Text(labelText.uppercased()).fontWeight(.bold)
          Spacer()
          Image(systemName: labelImage)
        }
      }
}


struct SettingsLabelView_Previews: PreviewProvider {
  static var previews: some View {
    SettingsLabelView(labelText: "Shazam Lyrics", labelImage: "info.circle")
      .previewLayout(.sizeThatFits)
      .padding()
  }
}
