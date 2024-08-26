import SwiftUI

struct ShazamView: View {
    
    @StateObject private var shazam = ShazamViewModel()
    
    var body: some View {
        NavigationView{
            VStack(alignment: .center){
                Spacer()
                if shazam.recording {
                    ProgressView()
                }
                
                AsyncImage(url: shazam.shazamModel.album) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .edgesIgnoringSafeArea(.all)
                } placeholder: {
                    EmptyView()
                }
                
                Text(shazam.shazamModel.title ?? "Sin titulo")
                    .font(.title)
                    .bold()
                Text(shazam.shazamModel.artist ?? "Sin artista")
                    .font(.title2)
                    .bold()
                
                
                Button(action: {
                    shazam.stop()
                }, label: {
                    Text("Stop")
                })
                
                
                Spacer()
                HStack{
                    Button(action:{
                        shazam.startListening()
                    }){
                        Text(shazam.recording ? "Escuchando" : "Escuchar")
                            .foregroundStyle(.color1)
                    }.buttonStyle(.bordered)
                        .controlSize(.large)
                        .shadow(radius: 4)
                        .tint(.accent)
                    
                    
                    NavigationLink(destination: LyricsView(artist: shazam.shazamModel.artist ?? "Sin artista", title: shazam.shazamModel.title ?? "Sin titulo")){
                        Text("Ver letra")
                            .foregroundStyle(.color1)
                    }.buttonStyle(.bordered)
                        .controlSize(.large)
                        .shadow(radius: 4)
                        .tint(.accent)
                }
                Spacer()
            }.padding(.all)
                .navigationTitle("Shazam Lyrics")
        }
    }
}


