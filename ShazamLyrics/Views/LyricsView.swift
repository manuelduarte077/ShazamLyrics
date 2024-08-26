import SwiftUI

struct LyricsView: View {
    
    @StateObject private var lyrics = LyricsViewModel()
    var artist: String
    var title: String
    
    var body: some View {
        VStack{
            Text(title)
                .font(.title2)
                .foregroundColor(.orange)
                .bold()
            
            ScrollView{
                Text(lyrics.lyricModel.lyrics ?? "Letra no encontrada")
                    .bold()
                    .multilineTextAlignment(.center)
                    .foregroundColor(.orange)
            }
        }.navigationTitle(artist)
            .task {
                await lyrics.fetch(artist: artist, title: title)
            }
    }
}


