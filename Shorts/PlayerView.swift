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
//            playerLayer.videoGravity = .resizeAspectFill
            return playerLayer.player
        }

        set {
            playerLayer.videoGravity = .resizeAspectFill
            player?.playImmediately(atRate: 1.0)
            playerLayer.player = newValue
        }
    }
    
    
//    var player: AVPlayer?
//
//    var playerLayer: AVPlayerLayer? = nil
//
//
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//
//        addPlayerToView(self)
//    }
//
//    required init?(coder: NSCoder) {
//        super.init(coder: coder)
////        fatalError("init(coder:) has not been implemented")
//    }
//
//    func addPlayerToView(_ view: UIView) {
//        player = AVPlayer()
//        playerLayer = AVPlayerLayer(player: player)
//        playerLayer.frame = self.bounds
//        self.layer.addSublayer(playerLayer)
//
////        playerLayer.contentsGravity = .bottom
//        playerLayer.videoGravity = .resizeAspectFill
//        NotificationCenter.default.addObserver(self, selector: #selector(PlayerEndPlay), name: .AVPlayerItemDidPlayToEndTime, object: nil)
//    }
//
//
//    @objc func PlayerEndPlay() {
//        print("player end playing")
//    }
//
    
    
    
    
    
}
