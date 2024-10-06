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
                    
                    VStack(alignment: .leading, spacing: 20) {
                        // TITLE
                        Text(artist)
                          .font(.largeTitle)
                          .fontWeight(.heavy)
                          .foregroundColor(.color1)
                        
                        // SUBHEADLINE
                        Text("Learn more about, \(title)".uppercased())
                          .fontWeight(.bold)
                          .foregroundColor(.color1)
                        
                        // DESCRIPTION
                        Text(lyrics.lyricModel.lyrics ?? "Letra no encontrada")
                          .multilineTextAlignment(.leading)
                        
                        // LINK
                        SourceLinkView()
                          .padding(.top, 10)
                          .padding(.bottom, 40)
                        
                    }
                    .padding(.horizontal, 10)
                    .frame(maxWidth: 640, alignment: .center)
                }
                .navigationBarTitle(title, displayMode: .inline)
                .navigationBarHidden(true)
                .task {
                    await lyrics.fetch(artist: artist, title: title)
                }
            }//: Scroll
            .edgesIgnoringSafeArea(.top)
        }
        .navigationViewStyle(StackNavigationViewStyle())
        
    }
}



#Preview {
    LyricsView(artist: "Vicente Fernandez", title: "La Ley del monte")
}

