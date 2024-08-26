import Foundation

@MainActor

class LyricsViewModel : ObservableObject {
    
    @Published var lyricModel = LyricsModel(lyrics: "", error: "")
    
    func fetch(artist: String, title: String) async {
        do{
            let urlStr = "https://api.lyrics.ovh/v1/\(artist)/\(title)"
            guard let url = URL(string: urlStr.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed) ?? "") else { return }
            
            
            let (data, _) = try await URLSession.shared.data(from: url)
            let datos = try JSONDecoder().decode(LyricsModel.self, from: data)
            
            self.lyricModel = datos
        }catch let error as NSError{
            print("error", error.localizedDescription)
        }
    }
    
}
