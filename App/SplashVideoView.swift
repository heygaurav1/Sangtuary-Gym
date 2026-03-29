import SwiftUI
import AVKit

struct SplashVideoView: View {
    @Binding var isFinished: Bool
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            // 1. Try to find the video
            if let url = Bundle.main.url(forResource: "splash", withExtension: "mp4") {
                VideoPlayer(player: AVPlayer(url: url))
                    .ignoresSafeArea()
                    .onAppear {
                        // Play for 3 seconds then enter app
                        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                            withAnimation {
                                isFinished = true
                            }
                        }
                    }
            } else {
                // 2. FALLBACK: If video is missing, show this logo
                VStack(spacing: 20) {
                    Image(systemName: "bolt.shield.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 80, height: 80)
                        .foregroundColor(.green)
                    
                    Text("SANCTUARY")
                        .font(.largeTitle.bold())
                        .kerning(5) // Correct SwiftUI way
                        .foregroundColor(.white)
                }
                .onAppear {
                    // Wait 2 seconds then enter app
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        withAnimation {
                            isFinished = true
                        }
                    }
                }
            }
        }
    }
}
