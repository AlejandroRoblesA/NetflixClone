//
//  YoutubeSearchResponse.swift
//  NetflixClone
//
//  Created by Alejandro Robles on 12/07/23.
//

import Foundation

struct YoutubeSearchResponse: Codable {
    let item: [VideoElement]
}

struct VideoElement: Codable {
    let id: IdVideoElement
}

struct IdVideoElement: Codable {
    let kind: String
    let videoId: String
}
