//
//  SourceLinkView.swift
//  ShazamLyrics
//
//  Created by Manuel Duarte on 11/9/24.
//

import SwiftUI

struct SourceLinkView: View {
  var body: some View {
    GroupBox() {
      HStack {
        Text("Content source")
        Spacer()
        Link("Music", destination: URL(string: "apple.music")!)
        Image(systemName: "arrow.up.right.square")
      }
      .font(.footnote)
    }
  }
}

#Preview {
    SourceLinkView()
}
