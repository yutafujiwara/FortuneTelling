//
//  ViewController.swift
//  FortuneTelling
//
//  Created by Yuta Fujiwara on 2017/08/18.
//  Copyright © 2017年 Yuta Fujiwara. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVSpeechSynthesizerDelegate {
    
    @IBOutlet var animalLabel:UILabel!
    @IBOutlet var resultLabel:UILabel!
    @IBOutlet var uranaiButton:UIButton!
    
    @IBAction func buttonTapped(sender:UIButton){
        
        let speechSynthesizer = AVSpeechSynthesizer()
        speechSynthesizer.delegate = self
        
        var speakingText = ""
        
        let rand = arc4random() % 5
        switch rand {
        case 0:
            speakingText = "大吉だパンダ！今日はいいことがあるよ"
            animalLabel.text = "🐼"
            resultLabel.text = "大吉"
            
        case 1:
            speakingText = "中吉だワン！犬も歩けば棒に当たるってね"
            animalLabel.text = "犬"
            resultLabel.text = "中吉"
            
        case 2:
            speakingText = "吉だブー！とんかつ食べるブー"
            animalLabel.text = "🐷"
            resultLabel.text = "吉"
            
        case 3:
            speakingText = "凶だぴょん！悪いことが起こるかもぴょんぴょん"
            animalLabel.text = "🐰"
            resultLabel.text = "凶"
            
        default:
            speakingText = "大凶だもー！もうお終いだもー！今日は寝なさい"
            animalLabel.text = "🐮"
            resultLabel.text = "大凶"
            
        }
        let utterrance = AVSpeechUtterance(string: speakingText)
        utterrance.voice = AVSpeechSynthesisVoice(language: "ja-JP")
        utterrance.volume = 1.0
        speechSynthesizer.speak(utterrance)
        
        uranaiButton.isHidden = true
        
        animalLabel.transform = CGAffineTransform(translationX: 0, y: -300)
        UIView.animate(withDuration: 0.5){
            self.animalLabel.transform = CGAffineTransform.identity
        }
    }
    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didFinish utterance: AVSpeechUtterance) {
        uranaiButton.isHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

