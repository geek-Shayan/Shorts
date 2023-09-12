//
//  PlayerCollectionViewCell.swift
//  Shorts
//
//  Created by SHAYANUL HAQ SADI on 7/9/23.
//

import UIKit
import AVKit
import AVFoundation

class PlayerCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "PlayerCollectionViewCell"
    
    var m3u8Url =  "https://iptv-isp.nexdecade.com/vod/shorts/clip/1.mp4/playlist.m3u8"  // "http://qthttp.apple.com.edgesuite.net/1010qwoeiuryfg/sl.m3u8"
    
//    var videoPlayer: AVPlayer? = nil
    
    var isPlaying: Bool = false

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var playerView: PlayerView!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var playPauseIndicatorImage: UIImageView!
    @IBOutlet weak var Progressslider: UISlider!
    
    @IBOutlet weak var descriptionStackView: UIStackView!
    
    @IBOutlet weak var channelImage: UIImageView!
    @IBOutlet weak var channelNameLabel: UILabel!
    @IBOutlet weak var subscribeButton: UIButton!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var tagsLabel: UILabel!
    
    
    @IBOutlet weak var actionStackView: UIStackView!
    
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var dislikeButton: UIButton!
    @IBOutlet weak var commentButton: UIButton!
    @IBOutlet weak var shareButton: UIButton!
    @IBOutlet weak var channelImage2: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupView()

        
    }
    
    private func setupView() {
        channelImage.layer.cornerRadius = channelImage.frame.height / 2.0
        channelImage2.layer.cornerRadius = 4
        
        subscribeButton.layer.cornerRadius = 4
        
        playerView.translatesAutoresizingMaskIntoConstraints = false
        
        activityIndicator.startAnimating()
        playPauseIndicatorImage.isHidden = true
        
//        likeButton.setTitle("gbjh", for: .highlighted)
//        likeButton.subtitleLabel?.text = "utfuyt"
//        likeButton.setTitle("loading.", for: .normal)
//        likeButton.setTitle("loading..", for: .normal)
//        likeButton.setTitle("loading...", for: .normal)
        
//        likeButton.setImage(UIImage(systemName: "circle"), for: .focused)
//        likeButton.setTitle("1.99$", for: .normal)
//        likeButton.subtitleLabel?.textAlignment = .center
//        likeButton.subtitleLabel?.text = "subtitle text to check how it..."


    }
    
    func playVideo() {
//        Progressslider.isHidden = true

//        guard let path = Bundle.main.path(forResource: "AppInventorL1Setupemulator", ofType:"mp4") else {
//            debugPrint("video.m4v not found")
//            return
//        }
        activityIndicator.stopAnimating()
        
        if let url = URL(string: m3u8Url) {
            
            let asset = AVURLAsset(url: url, options: nil)
            let playerItem = AVPlayerItem(asset: asset)
            playerView.player = AVPlayer(playerItem: playerItem)

            playerView.player?.playImmediately(atRate: 1)
//            playerView.playerLayer.videoGravity = .resizeAspectFill
            
            isPlaying = true
        }
    }
    
    
//    private func startPlayer() {
//        slider.isHidden = true
//        if let url = URL(string: m3u8Url) {
//            let asset = AVURLAsset(url: url, options: nil)
//            let playerItem = AVPlayerItem(asset: asset)
//            videoPlayer = AVPlayer(playerItem: playerItem)
//            videoPlayer?.addObserver(self, forKeyPath: "status", options: [], context: nil)
//            // listen the current time of playing video
////            videoPlayer?.addPeriodicTimeObserver(forInterval: CMTime(seconds: Double(1), preferredTimescale: 2), queue: DispatchQueue.main) { [weak self] (sec) in
////                guard let self = self else { return }
////                let seconds = CMTimeGetSeconds(sec)
////                let (hours, minutes, second) = self.getHoursMinutesSecondsFrom(seconds: seconds)
////                self.title = "\(hours):\(minutes):\(second)"
////                self.slider.value = Float(seconds)
////            }
//            videoPlayer?.volume = 1.0
//            
//            let layer: AVPlayerLayer = AVPlayerLayer(player: videoPlayer)
//            layer.backgroundColor = UIColor.white.cgColor
//            layer.frame = playerView.bounds
//            layer.videoGravity = .resizeAspectFill
//            playerView.layer.sublayers?
//                .filter { $0 is AVPlayerLayer }
//                .forEach { $0.removeFromSuperlayer() }
//            playerView.layer.addSublayer(layer)
//        }
//        initSlider()
//    }
    
    
    
    func stopVideo() {
        playerView.player?.pause()
        isPlaying = false
        
    }
    
    func changePlayerItem() {
        
//        if playerView.player?.currentItem == nil {
//
//            playerView.player?.replaceCurrentItem(with: playerItem)
//        }
    }
    
    func deSelected() {
//        genreBackgroundView.backgroundColor = UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
    }
    
    func setup( label: String) {
//        genreLabel.text = label
    }

}
