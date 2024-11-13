//
//  VideoViewModel.swift
//  Youtube-VisionOS
//
//  Created by esther.huecas.local on 13/11/24.
//

import Foundation
import Observation

/// - @Observable
/// Any change in this viewmodel send a notification on code that is listening.
/// Refresh new information from videos
@Observable
class VideoViewModel {
    var videos: [VideoModel] = []
    var videosID: Set<VideoModel.ID> = [] // unique identifier
    
    init() {
        getVideos()
    }
    
    func getVideos() {
        Task {
            do {
                // TODO: set YOUTUBE API
                guard let url = URL(string: "https://raw.githubusercontent.com/SwiftBeta/YoutubeStaticBackend/main/getVideos.json") else { return }
                let (jsonData, _) = try await URLSession.shared.data(from: url)
                videos = try JSONDecoder().decode([VideoModel].self, from: jsonData)
            } catch {
                videos = []
            }
        }
    }
    
    func isVideosIdEmpty() -> Bool {
        videosID.isEmpty
    }
    
    func getSelectedVideoId() -> String {
        videos.first(where: { $0.id == videosID.first })?.url ?? ""
    }
    
    func getSelectedVideoTitle() -> String {
        videos.first(where: { $0.id == videosID.first })?.title ?? "No title"
    }
}
