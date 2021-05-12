//
//  SplashScreenViewController.swift
//  GameOfThrones
//
//  Created by Mesut Aygün on 12.05.2021.
//

import UIKit
import AVFoundation

class SplashScreenViewController: UIViewController {
   
    
    @IBOutlet var throneImage: UIImageView!
    
    var audioPlayer : AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        playSound(name: "GoT_theme")
        
        let animate = throneImage.frame.origin.y
        throneImage.frame.origin.y = self.view.frame.height
        UIView.animate(withDuration: 1.0, delay: 1.0) {
            self.throneImage.frame.origin.y = animate
        } 

    }

    func playSound(name:String) {
        if let sound = NSDataAsset(name: name) {
            do{
                try audioPlayer = AVAudioPlayer(data: sound.data)
                audioPlayer.play()
                
            }catch{
                
                print("error sound")
            }
        }else {
            print("error playsound")
        }
    }
    
    
    @IBAction func imageTap(_ sender: UITapGestureRecognizer) {
        if audioPlayer != nil {
            audioPlayer.stop()
        }
        performSegue(withIdentifier: "tableVC", sender: nil)
    }
    

}
