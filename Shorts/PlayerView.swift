//
//  PlayerView.swift
//  Shorts
//
//  Created by SHAYANUL HAQ SADI on 8/9/23.
//

import UIKit
import AVFoundation
import AVKit

class PlayerView: UIView {
    
    override static var layerClass: AnyClass {
        return AVPlayerLayer.self
    }

    var playerLayer: AVPlayerLayer {
    
        return layer as! AVPlayerLayer
    }

    var player: AVPlayer? {
        get {
            return playerLayer.player
        }
    
        set {
            playerLayer.player = newValue
        }
    }
}
