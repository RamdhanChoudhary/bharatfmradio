//
//  PlayerViewController.swift
//  Bharat FM Radio
//
//  Created by RAMDHAN CHOUDHARY on 10/08/19.
//  Copyright © 2019 RDC Innovations Pvt Ltd. All rights reserved.
//

import UIKit
import AVFoundation

class PlayerViewController: UIViewController {

    //let urlFile = URL(string:"http://player.absoluteradio.co.uk/tunein.php?i=a624.aac")!
    private var avAudioSession:AVAudioSession = AVAudioSession.sharedInstance()
    var player : AVPlayer!
    
    @IBOutlet weak var volumeSlider: UISlider!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var bgImageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        crateAudioSession()
        
        self.navigationItem.setHidesBackButton(true, animated:true)

        
        let jeremyGif = UIImage.gifImageWithName("audio_animation_circle")
        let imageView = UIImageView(image: jeremyGif)
        imageView.frame = CGRect(x: 0, y: 100, width: self.view.frame.size.width, height: 210)
        view.addSubview(imageView)
        
        let gesture = UISwipeGestureRecognizer(target: self, action: #selector(PlayerViewController.handleSwipe))
        gesture.direction = .right
        self.view.addGestureRecognizer(gesture)
        
        startFirstTimePlayer()
    }
    
    func startFirstTimePlayer()
    {
        //let url = "http://listen.shoutcast.com/radiodeltalebanon"//99427180
        let url = "http://yp.shoutcast.com/sbin/tunein-station.m3u?id=1795332"
        player = AVPlayer(url: URL(string: url)!)
        player.rate = 1.0
        player.volume = 0.22
        player.play()
        self.playButton.isSelected = !self.playButton.isSelected
        print("player started..")
    }
    
    @objc func handleSwipe(sender: UISwipeGestureRecognizer) {
        print("swipe direction is",sender.direction)
        if let navController = self.navigationController
        {
            navController.popViewController(animated: true)
        }
    }
    
    func crateAudioSession()
    {
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playback)
            print("AVAudioSession Category Playback OK")
            do {
                try AVAudioSession.sharedInstance().setActive(true)
                print("AVAudioSession is Active")
                
            } catch let error as NSError {
                print(error.localizedDescription)
            }
        } catch let error as NSError {
            print(error.localizedDescription)
        }
    }
    
    
    
    @IBAction func sliderValueChanged(_ sender: Any) {
        if player != nil {
            print("volume is", volumeSlider.value)
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
                let url = "http://yp.shoutcast.com/sbin/tunein-station.m3u?id=1795332"
                player = AVPlayer(url: URL(string: url)!)
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
}
