//
//  ViewController.swift
//  KennyGame
//
//  Created by Selim KOÇAK on 27.08.2017.
//  Copyright © 2017 Selim KOÇAK. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var timeLable: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var highScoreLabel: UILabel!
    @IBOutlet weak var kedi1: UIImageView!
    @IBOutlet weak var kedi2: UIImageView!
    @IBOutlet weak var kedi3: UIImageView!
    @IBOutlet weak var kedi4: UIImageView!
    @IBOutlet weak var kedi5: UIImageView!
    @IBOutlet weak var kedi6: UIImageView!
    @IBOutlet weak var kedi7: UIImageView!
    @IBOutlet weak var kedi8: UIImageView!
    @IBOutlet weak var kedi9: UIImageView!
    
    var score = 0
    var timer = Timer()
    var counter = 30
    var kediArray = [UIImageView]()
    var hideTimer = Timer()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let highScore = UserDefaults.standard.object(forKey: "highscore")
        
        if highScore == nil {
            highScoreLabel.text = "0"
        }
        if let newScore = highScore as? Int {
            highScoreLabel.text = String(newScore)
        }
        
        
        
        scoreLabel.text = "Score: \(score)"
        
        
        let recognizer1 = UITapGestureRecognizer(target: self, action: #selector(ViewController.increaseScore))
        let recognizer2 = UITapGestureRecognizer(target: self, action: #selector(ViewController.increaseScore))
        let recognizer3 = UITapGestureRecognizer(target: self, action: #selector(ViewController.increaseScore))
        let recognizer4 = UITapGestureRecognizer(target: self, action: #selector(ViewController.increaseScore))
        let recognizer5 = UITapGestureRecognizer(target: self, action: #selector(ViewController.increaseScore))
        let recognizer6 = UITapGestureRecognizer(target: self, action: #selector(ViewController.increaseScore))
        let recognizer7 = UITapGestureRecognizer(target: self, action: #selector(ViewController.increaseScore))
        let recognizer8 = UITapGestureRecognizer(target: self, action: #selector(ViewController.increaseScore))
        let recognizer9 = UITapGestureRecognizer(target: self, action: #selector(ViewController.increaseScore))
            
            kedi1.isUserInteractionEnabled = true
            kedi2.isUserInteractionEnabled = true
            kedi3.isUserInteractionEnabled = true
            kedi4.isUserInteractionEnabled = true
            kedi5.isUserInteractionEnabled = true
            kedi6.isUserInteractionEnabled = true
            kedi7.isUserInteractionEnabled = true
            kedi8.isUserInteractionEnabled = true
            kedi9.isUserInteractionEnabled = true
            
            kedi1.addGestureRecognizer(recognizer1)
            kedi2.addGestureRecognizer(recognizer2)
            kedi3.addGestureRecognizer(recognizer3)
            kedi4.addGestureRecognizer(recognizer4)
            kedi5.addGestureRecognizer(recognizer5)
            kedi6.addGestureRecognizer(recognizer6)
            kedi7.addGestureRecognizer(recognizer7)
            kedi8.addGestureRecognizer(recognizer8)
            kedi9.addGestureRecognizer(recognizer9)
        
        
        
        // timers
        
          counter = 30
          timeLable.text = String(counter)
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.countDown), userInfo: nil, repeats: true)
        
        
        
        hideTimer = Timer.scheduledTimer(timeInterval: 0.25, target: self, selector: #selector(ViewController.hideKedi), userInfo: nil, repeats: true)
        
        
        
        
        // arrays
        
        kediArray.append(kedi1)
        kediArray.append(kedi2)
        kediArray.append(kedi3)
        kediArray.append(kedi4)
        kediArray.append(kedi5)
        kediArray.append(kedi6)
        kediArray.append(kedi7)
        kediArray.append(kedi8)
        kediArray.append(kedi9)
        
        hideKedi()
        
        }
    
    @objc func hideKedi() {
     
        for kedi in kediArray {
            kedi.isHidden = true
        }
        
        let random = Int(arc4random_uniform(UInt32(kediArray.count - 1)))
        kediArray[random].isHidden = false
    }
    
    
          @objc func countDown(){
            
            counter = counter - 1
            timeLable.text = "\(counter)"
            
            if counter == 0 {
                timer.invalidate()
                hideTimer.invalidate()
                
                
                if self.score > Int(highScoreLabel.text!)! {
                    
                    UserDefaults.standard.set(self.score, forKey: "highscore")
                    highScoreLabel.text = String(self.score)
                    
                   
                    
                }
                
                
                
                let alert = UIAlertController(title: "Time", message: "Time's Up", preferredStyle: UIAlertControllerStyle.alert)
                let okButton = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil)
                alert.addAction(okButton)
                
                let replayButton = UIAlertAction(title: "Replay", style: UIAlertActionStyle.cancel, handler: { (UIAlertAction) in
                    
                    self.score = 0
                    self.scoreLabel.text = "Score: \(self.score)"
                    self.counter = 30
                    self.timeLable.text = "\(self.counter)"
                    
                    self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.countDown), userInfo: nil, repeats: true)
                    
                    self.hideTimer = Timer.scheduledTimer(timeInterval: 0.25, target: self, selector: #selector(ViewController.hideKedi), userInfo: nil, repeats: true)
               
                })
                
                alert.addAction(replayButton)
                alert.addAction(okButton)
                self.present(alert, animated: true, completion: nil)
                
                
            }
            
        
    }
   
    
          @objc func increaseScore() {
            score = score + 1
            scoreLabel.text = "Score: \(score)"
            
    }


}
    

