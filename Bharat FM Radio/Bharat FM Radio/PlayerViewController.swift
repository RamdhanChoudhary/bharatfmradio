//
//  PlayerViewController.swift
//  Bharat FM Radio
//
//  Created by RAMDHAN CHOUDHARY on 10/08/19.
//  Copyright © 2019 RDC Innovations Pvt Ltd. All rights reserved.
//

import UIKit
import AVFoundation
import MediaPlayer

class PlayerViewController: UIViewController {
    
    var liveStreamURL = "http://listen.shoutcast.com/radiodeltalebanon"
    var liveStationName = "Test"

    //private var avAudioSession:AVAudioSession = AVAudioSession.sharedInstance()
    var player : AVPlayer!
    @IBOutlet weak var volumeSlider: UISlider!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var bgImageView: UIImageView!
    @IBOutlet weak var nowPlayingLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("liveStreamURL: ", liveStreamURL)
        
        customizeNavigatonBar()
        addSwipeGesture()
        addGiffyImage()
        customizeRemoteControls()
        startFirstTimePlayer()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        //remove plyer when user go back
        if player != nil
        {
            player.pause()
            player = nil
        }
        
    }

    
    func customizeNavigatonBar()
    {
        self.navigationItem.setHidesBackButton(true, animated:true)
        
        Timer.scheduledTimer(timeInterval: 12.0, target: self, selector: #selector(PlayerViewController.labelAnimation), userInfo: nil, repeats: true)
        nowPlayingLabel.text = liveStationName + " Live Streaming Online"
    }
    
    @objc func labelAnimation()
    {
        UIView.animate(withDuration: 10.0, delay: 0.0, options: UIView.AnimationOptions(rawValue: UIView.AnimationOptions.RawValue(0 << 1)), animations: {
            self.nowPlayingLabel.frame = CGRect(x: -320, y: self.nowPlayingLabel.frame.origin.y, width: self.nowPlayingLabel.frame.width, height: self.nowPlayingLabel.frame.height)
        }) { finished in
            self.nowPlayingLabel.frame = CGRect(x: 340, y: self.nowPlayingLabel.frame.origin.y, width: self.nowPlayingLabel.frame.width, height: self.nowPlayingLabel.frame.height)
        }
    }

    
    func addSwipeGesture()
    {
        let gesture = UISwipeGestureRecognizer(target: self, action: #selector(PlayerViewController.handleSwipe))
        gesture.direction = .right
        self.view.addGestureRecognizer(gesture)
    }
    
    func addGiffyImage()
    {
        let jeremyGif = UIImage.gifImageWithName("audio_animation_circle")
        let imageView = UIImageView(image: jeremyGif)
        imageView.frame = CGRect(x: 0, y: 100, width: self.view.frame.size.width, height: 210)
        view.addSubview(imageView)
    }
    
    
    func startFirstTimePlayer()
    {
        if self.playButton.isSelected != true//Play
        {
            player = AVPlayer(url: URL(string: liveStreamURL)!)
            player.rate = 1.0
            
            let vol = AVAudioSession.sharedInstance().outputVolume
            player.volume = vol
            volumeSlider.value = vol
            player.play()
            print("player started..")
            self.playButton.isSelected = !self.playButton.isSelected

        }
    }
    
    
    
    
    
    @objc func handleSwipe(sender: UISwipeGestureRecognizer) {
        if let navController = self.navigationController{
            navController.popViewController(animated: true)
        }
    }
    
    @IBAction func sliderValueChanged(_ sender: Any) {
        if player != nil {
            player.volume = volumeSlider.value
            
            //Update system volume
            MPVolumeView.setVolume(volumeSlider.value)
        }
    }
    
    @IBAction func startOrstopPlayer(_ sender: Any) {
        
        if self.playButton.isSelected != true//Play
        {
            
            if player != nil
            {
                player.pause()
                player = nil
            }
            
            player = AVPlayer(url: URL(string: liveStreamURL)!)
            player.rate = 1.0
            
            let vol = AVAudioSession.sharedInstance().outputVolume
            player.volume = vol
            volumeSlider.value = vol
            player.play()
            print("player started..")
        }
        else //Stop
        {
            if player != nil {
                player.pause()
                print("player closed.")
                
            }
            
        }
        self.playButton.isSelected = !self.playButton.isSelected
    }
    
    
// ======== respond to remote controls
    func customizeRemoteControls()
    {
        let commandCenter = MPRemoteCommandCenter.shared()
        
        //        commandCenter.previousTrackCommand.enabled = true;
        //        commandCenter.previousTrackCommand.addTarget(self, action: "previousTrack")
        //
        //        commandCenter.nextTrackCommand.enabled = true
        //        commandCenter.nextTrackCommand.addTarget(self, action: "nextTrack")
        
        commandCenter.playCommand.isEnabled = true
        commandCenter.playCommand.addTarget(self, action:  #selector(PlayerViewController.playAudio))
        
        commandCenter.pauseCommand.isEnabled = true
        commandCenter.pauseCommand.addTarget(self, action:  #selector(PlayerViewController.pauseAudio))
        
//        commandCenter.togglePlayPauseCommand.addTarget { (event) -> MPRemoteCommandHandlerStatus in
//            //Update your button here for the play command
//            return .success
//        }
        
        commandCenter.skipBackwardCommand.isEnabled = false
        commandCenter.skipForwardCommand.isEnabled = false
    }
    
    @objc func playAudio()
    {
        if player != nil{
            player.play()
            self.playButton.isSelected = !self.playButton.isSelected
        }
        
        
    }
    
    @objc func pauseAudio()
    {
        if player != nil {
            player.pause()
            self.playButton.isSelected = !self.playButton.isSelected
        }
        
    }

}

//Update system volume
extension MPVolumeView {
    static func setVolume(_ volume: Float) {
        let volumeView = MPVolumeView()
        let slider = volumeView.subviews.first(where: { $0 is UISlider }) as? UISlider
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.01) {
            slider?.value = volume
        }
    }
}
