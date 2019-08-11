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

    //let urlFile = URL(string:"http://player.absoluteradio.co.uk/tunein.php?i=a624.aac")!
    
    var liveStreamURL = "http://yp.shoutcast.com/sbin/tunein-station.m3u?id=1795332"
    private var avAudioSession:AVAudioSession = AVAudioSession.sharedInstance()
    var player : AVPlayer!
    
    @IBOutlet weak var volumeSlider: UISlider!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var bgImageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("liveStreamURL: ", liveStreamURL)
        
        customizeNavigatonBar()
        addSwipeGesture()
        addGiffyImage()
        customizeRemoteControls()
        startFirstTimePlayer()
    }
    
    func customizeNavigatonBar()
    {
        self.navigationItem.setHidesBackButton(true, animated:true)
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
        //let url = "http://listen.shoutcast.com/radiodeltalebanon"//99427180
        //let audioPlayer:AVAudioPlayer = try AVAudioPlayer(contentsOf: URL(string: url)!)//for playing local media
        //let url = "http://yp.shoutcast.com/sbin/tunein-station.m3u?id=1795332"
        
        
        player = AVPlayer(url: URL(string: liveStreamURL)!)//for streaming from a remote server and local media
        player.rate = 1.0
        player.volume = 0.22
        player.play()
        
        self.playButton.isSelected = !self.playButton.isSelected
        print("player started..")
    }
    
    @objc func handleSwipe(sender: UISwipeGestureRecognizer) {
        if let navController = self.navigationController{
            navController.popViewController(animated: true)
        }
    }
    
    
    
    
    
    @IBAction func sliderValueChanged(_ sender: Any) {
        if player != nil {
            //print("volume is", volumeSlider.value)
            player.volume = volumeSlider.value
        }
    }
    
    @IBAction func startOrstopPlayer(_ sender: Any) {
        if self.playButton.isSelected != true {
            if player != nil{
                player.play()
            }
            else{
                //let url = "http://listen.shoutcast.com/radiodeltalebanon"//99427180
                //let url = "http://yp.shoutcast.com/sbin/tunein-station.m3u?id=1795332"
                player = AVPlayer(url: URL(string: liveStreamURL)!)
                player.rate = 1.0
                player.volume = 0.22
                player.play()
                print("player started..")
            }
        }
        else{
            if player != nil {
                player.pause()
                player = nil
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
        
        commandCenter.togglePlayPauseCommand.addTarget { (event) -> MPRemoteCommandHandlerStatus in
            //Update your button here for the play command
            return .success
        }
        
        commandCenter.skipBackwardCommand.isEnabled = false
        commandCenter.skipForwardCommand.isEnabled = false
    }
    
    @objc func playAudio()
    {
        print("nextTrackCommandSelector")
        
        if player != nil{
            player.play()
        }
        else{
            //let url = "http://listen.shoutcast.com/radiodeltalebanon"//99427180
            //let url = "http://yp.shoutcast.com/sbin/tunein-station.m3u?id=1795332"
            player = AVPlayer(url: URL(string: liveStreamURL)!)
            player.rate = 1.0
            player.volume = 0.22
            player.play()
            print("player started..")
        }
        self.playButton.isSelected = !self.playButton.isSelected
    }
    
    @objc func pauseAudio()
    {
        print("nextTrackCommandSelector")
        if player != nil {
            player.pause()
            player = nil
        }
        self.playButton.isSelected = !self.playButton.isSelected
    }

 
 
}
