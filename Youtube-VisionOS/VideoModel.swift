//
//  VideoModel.swift
//  Youtube-VisionOS
//
//  Created by esther.huecas.local on 13/11/24.
//

import Foundation

struct VideoModel: Identifiable, Decodable, Hashable {
    let id: UUID
    let url: String
    let title: String
    let image: String
}
