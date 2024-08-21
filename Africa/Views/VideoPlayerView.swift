import SwiftUI
import AVKit

struct VideoPlayerView: View {
    
    let videoName: String
    let videoTitle: String
    
    var body: some View {
        VStack {
            VideoPlayer(player: playVideo(fileName: videoName, fileExtension: "mp4"))
                .overlay(
                    Image("logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 32, height: 32)
                        .padding()
                    , alignment: .topLeading
                )
        }//: Vstack
        .accentColor(.accentColor)
        .navigationBarTitle(videoTitle, displayMode: .inline)
    }
}

#Preview {
    VideoPlayerView(videoName: "lion", videoTitle: "Lion")
}
