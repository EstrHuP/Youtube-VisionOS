//
//  ContentView.swift
//  Youtube-VisionOS
//
//  Created by esther.huecas.local on 13/11/24.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {
    @State var viewModel = VideoViewModel()
    @State var selectedFavorite: Bool = false
    
    var body: some View {
        NavigationSplitView {
            List(viewModel.videos, selection: $viewModel.videosID) { video in
                VStack {
                    AsyncImage(url: .init(string: video.image), scale: 1.0) { imageVideo in
                        imageVideo.resizable()
                            .scaledToFit()
                            .cornerRadius(20)
                    } placeholder: {
                        ProgressView()
                    }
                    Text(video.title)
                        .font(.title)
                        .padding(.top, 2)
                }
                .padding()
            }
            .navigationTitle("YouTube")
        } detail: {
            VStack {
                if !viewModel.isVideosIdEmpty() {
                    VStack {
                        Text(viewModel.getSelectedVideoTitle())
                            .font(.largeTitle)
                        VideoDetail(videoID: viewModel.getSelectedVideoId())
                            .padding()
                    }
                }
            }
            .toolbar {
                ToolbarItem {
                    Button {
                        selectedFavorite.toggle()
                    } label: {
                        Label("Favorite", systemImage: "heart")
                            .symbolVariant(selectedFavorite ? .fill : .none)
                    }
                }
            }
        }
        /// New view for VisionOS
        .ornament(attachmentAnchor: .scene(.bottom)) {
            VStack {
                Text("Subscribe for more")
            }
            .frame(width: 400, height: 60)
            .glassBackgroundEffect() // more legible
        }
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
}
