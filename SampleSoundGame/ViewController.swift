//
//  ViewController.swift
//  SampleSoundGame
//
//  Created by 矢野史洋 on 2016/05/29.
//  Copyright © 2016年 矢野史洋. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVAudioPlayerDelegate {

    @IBOutlet weak var startGameButton: UIButton!
    @IBOutlet var soundButton: [UIButton]!
    @IBOutlet weak var levelLabel: UILabel!
    
    var sound1Player:AVAudioPlayer!
    var sound2Player:AVAudioPlayer!
    var sound3Player:AVAudioPlayer!
    var sound4Player:AVAudioPlayer!
    
    var playlist = [Int]()
    var currentItem = 0
    var numberOfTaps = 0
    var readyForUser = false
    
    var level = 1
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAudioFiles()
    }
    
    func setupAudioFiles(){
        
        let soundFilePath = NSBundle.mainBundle().pathForResource("1", ofType: "wav")
        let soundFileURL = NSURL(fileURLWithPath: soundFilePath!)
        
        let soundFilePath2 = NSBundle.mainBundle().pathForResource("2", ofType: "wav")
        let soundFileURL2 = NSURL(fileURLWithPath: soundFilePath2!)
        
        let soundFilePath3 = NSBundle.mainBundle().pathForResource("3", ofType: "wav")
        let soundFileURL3 = NSURL(fileURLWithPath: soundFilePath3!)
        
        let soundFilePath4 = NSBundle.mainBundle().pathForResource("4", ofType: "wav")
        let soundFileURL4 = NSURL(fileURLWithPath: soundFilePath4!)
        
        do {
            try sound1Player = AVAudioPlayer(contentsOfURL: soundFileURL)
            try sound2Player = AVAudioPlayer(contentsOfURL: soundFileURL2)
            try sound3Player = AVAudioPlayer(contentsOfURL: soundFileURL3)
            try sound4Player = AVAudioPlayer(contentsOfURL: soundFileURL4)
        }catch {
            print(error)
        }
        
        sound1Player.delegate = self
        sound2Player.delegate = self
        sound3Player.delegate = self
        sound4Player.delegate = self
        
        sound1Player.numberOfLoops = 0
        sound2Player.numberOfLoops = 0
        sound3Player.numberOfLoops = 0
        sound4Player.numberOfLoops = 0
    }
    
    @IBAction func soundButtonPressed(sender: AnyObject) {
        let button = sender as! UIButton
        
        switch button.tag {
        case 1:
            sound1Player.play()
        case 2:
            sound2Player.play()
        case 3:
            sound3Player.play()
        case 4:
            sound4Player.play()
        default:
            break
        }
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

