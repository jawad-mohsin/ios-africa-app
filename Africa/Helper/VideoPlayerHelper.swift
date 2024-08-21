import Foundation
import SwiftUI
import AVKit


var videoPlayer: AVPlayer?

func playVideo(fileName: String, fileExtension: String) -> AVPlayer {
    if Bundle.main.url(forResource: fileName, withExtension: fileExtension) != nil {
        videoPlayer = AVPlayer(url: Bundle.main.url(forResource: fileName, withExtension: fileExtension)!)
        videoPlayer?.play()
    }
    return videoPlayer!;
}
