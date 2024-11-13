//
//  VideoDetail.swift
//  Youtube-VisionOS
//
//  Created by esther.huecas.local on 13/11/24.
//

import Foundation
import WebKit
import SwiftUI

struct VideoDetail: UIViewRepresentable {
    let videoID: String
    
    func makeUIView(context: Context) -> WKWebView {
        WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        guard let youtubeURL = URL(string: "https://www.youtube.com/embed/\(videoID)") else { return }
        uiView.scrollView.isScrollEnabled = false
        uiView.load(URLRequest(url: youtubeURL))
    }
}
