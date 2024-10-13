import ShazamKit
import AVKit
import SwiftUI

class ShazamViewModel: NSObject, ObservableObject, SHSessionDelegate {
    
    @Published var session = SHSession()
    
    // Audio Engine...
    @Published var audioEngine = AVAudioEngine()
    
    // Error...
    @Published var errorMsg = ""
    @Published var showError = false
    
    // Recording Status...
    @Published var isRecording = false
    
    // Form Track...
    @Published var matchedTrack: Track!
    
    override init() {
        super.init()
        session.delegate = self
    }
    
    func session(_ session: SHSession, didFind match: SHMatch) {
        
        // Match Found...
        if let firstItem = match.mediaItems.first {
            
            print(firstItem.title ?? "")
            
            DispatchQueue.main.async {
                self.matchedTrack = Track(
                    title: firstItem.title ?? "",
                    artist: firstItem.artist ?? "",
                    artwork: firstItem.artworkURL ?? URL(string: "")!,
                    genres: firstItem.genres,
                    appleMusicURL: firstItem.appleMusicURL ?? URL(string: "")!
                )
                
                self.stopRecording()
            }
        }
    }
    
    func session(_ session: SHSession, didNotFindMatchFor signature: SHSignature, error: Error?) {
        
        // No match...
        DispatchQueue.main.async {
            self.errorMsg = error?.localizedDescription ?? "No music found"
            self.showError.toggle()
            // stoppin Audio recording
            self.stopRecording()
        }
    }
    
    func stopRecording() {
        audioEngine.stop()
        withAnimation {
            isRecording = false
        }
    }
    
    // Fetch Music
    func listnenMusic() {
        
        let audioSession = AVAudioSession.sharedInstance()
        
        // checking for permission...
        audioSession.requestRecordPermission { status in
            if status {
                self.recordAudio()
            }
            else {
                self.errorMsg = "Please allow microphone access !!!"
                self.showError.toggle()
            }
        }
    }
    
    func recordAudio() {
        // Checking if already recording...
        // then stopping it...
        if audioEngine.isRunning {
            self.stopRecording()
            return
        }
        
        // Recording...
        // First create a node...
        // Then Listnen to it...
        
        let inputMode = audioEngine.inputNode
        let format = inputMode.outputFormat(forBus: .zero)
        
        // removing tap if already installed
        inputMode.removeTap(onBus: .zero)
        
        inputMode.installTap(onBus: .zero, bufferSize: 1024, format: format) { buffer, time in
            
            // Start Shazam Session...
            self.session.matchStreamingBuffer(buffer, at: time)
        }
        
        // Start audio service...
        audioEngine.prepare()
        
        do {
            try audioEngine.start()
            print("Started audio...")
            withAnimation {
                self.isRecording = true
            }
        }
        catch {
            self.errorMsg = error.localizedDescription
            self.showError.toggle()
        }
        
    }
}

