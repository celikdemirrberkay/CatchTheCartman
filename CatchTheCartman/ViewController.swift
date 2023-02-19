//
//  ViewController.swift
//  CatchTheCartman
//
//  Created by Berkay  on 19.02.2023.
//

import UIKit

class ViewController: UIViewController {

    var kennyList : [UIImageView] = []
    var score = 0
    var counter = 20
    var timer = Timer()
    var highestScore = UserDefaults.standard.object(forKey: "highestScoreKenny") as! Int

    
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var scoreLabel: UILabel!
   
    @IBOutlet weak var kennyOne: UIImageView!
    
    @IBOutlet weak var kennytwo: UIImageView!
    
    @IBOutlet weak var kennyThree: UIImageView!
    
    @IBOutlet weak var kennyFor: UIImageView!
    
    @IBOutlet weak var kennyFive: UIImageView!
    
    @IBOutlet weak var kennySix: UIImageView!
    
    @IBOutlet weak var kennySeven: UIImageView!
    
    @IBOutlet weak var kennyEight: UIImageView!
    
    @IBOutlet weak var kennyNine: UIImageView!
    
    @IBOutlet weak var highestScoreLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        //Call insert kennys func
        insertKennysInTheList()
        
        hideKennys()
        
        timeLabel.text = "Time : \(counter)"
        
        scoreLabel.text = "Score : \(score)"
        
        highestScoreLabel.text = "Highest Score : \(highestScore)"
        
        for images in kennyList {
            images.isUserInteractionEnabled = true
        }
        
        let gesturRecognizer1 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let gesturRecognizer2 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let gesturRecognizer3 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let gesturRecognizer4 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let gesturRecognizer5 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let gesturRecognizer6 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let gesturRecognizer7 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let gesturRecognizer8 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let gesturRecognizer9 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        
        kennyOne.addGestureRecognizer(gesturRecognizer1)
        kennytwo.addGestureRecognizer(gesturRecognizer2)
        kennyThree.addGestureRecognizer(gesturRecognizer3)
        kennyFor.addGestureRecognizer(gesturRecognizer4)
        kennyFive.addGestureRecognizer(gesturRecognizer5)
        kennySix.addGestureRecognizer(gesturRecognizer6)
        kennySeven.addGestureRecognizer(gesturRecognizer7)
        kennyEight.addGestureRecognizer(gesturRecognizer8)
        kennyNine.addGestureRecognizer(gesturRecognizer9)

        

        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(selectorFunction), userInfo: nil, repeats: true)
        
        
    }

    
    // Increase score on every tap
    @objc func increaseScore (){
        score = score + 1
        scoreLabel.text = "Score : \(score)"
    }
    
    // Selector Function
    @objc func selectorFunction(){
        
        hideKennys()
        
        let randomNumber = Int.random(in: 0...kennyList.count-1)
        
        timeLabel.text = "Time : \(counter)"
        counter = counter - 1
        kennyList[randomNumber].isHidden = false

        
        if (counter == 0 ){
            hideKennys()
            timer.invalidate()
            timeLabel.text = "Time is off !"
            counter = 20
            if(highestScore < score ){
                highestScore = score
                saveHighestScore()
                highestScoreLabel.text = "Highest Score : \(highestScore)"
            }
            
            let alert = UIAlertController(title: "Game Over !", message: "Play again ?", preferredStyle: UIAlertController.Style.alert)
            let okButton = UIAlertAction(title: "YES", style: UIAlertAction.Style.default){(UIAlertAction) in
                self.score = 0
                self.counter = 20
                self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.selectorFunction), userInfo: nil, repeats: true)
            }
            let noButton = UIAlertAction(title: "NO", style: UIAlertAction.Style.cancel)
            alert.addAction(okButton)
            alert.addAction(noButton)
            self.present(alert, animated: true, completion: nil)
            
        }
        
        
    }
    
    // Add Kenny's to list
    func insertKennysInTheList(){
        
        kennyList.append(kennyOne)
        kennyList.append(kennytwo)
        kennyList.append(kennyThree)
        kennyList.append(kennyFor)
        kennyList.append(kennyFive)
        kennyList.append(kennySix)
        kennyList.append(kennySeven)
        kennyList.append(kennyEight)
        kennyList.append(kennyNine)

        
    }
    
    // Hide all Kenny's
    func hideKennys(){
        for images in kennyList {
            images.isHidden = true
        }
    }
    
    
    func saveHighestScore(){
        
        UserDefaults.standard.set(highestScore, forKey: "highestScoreKenny")
        
    }
    

    
    
    
    
    
    
    
}

