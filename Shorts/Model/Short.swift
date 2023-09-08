//
//  Short.swift
//  Shorts
//
//  Created by SHAYANUL HAQ SADI on 9/9/23.
//

import Foundation

// MARK: - Short
struct Short: Codable {
    let description: String
    let thumbnail: String
    let mediaURL: String
    let tags: String
    let reactions: Reactions
    let channelName: String
    let channelPhotoURL: String
    let shareURL, channelURL: String

    enum CodingKeys: String, CodingKey {
        case description, thumbnail
        case mediaURL = "mediaUrl"
        case tags, reactions, channelName
        case channelPhotoURL = "channelPhotoUrl"
        case shareURL = "shareUrl"
        case channelURL = "channelUrl"
    }
}
