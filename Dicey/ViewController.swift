//
//  ViewController.swift
//  Dicey
//
//  Created by Kautilya on 31/05/18.
//  Copyright © 2018 Kautilya. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //IBOutlets
    @IBOutlet weak var shakeLabel: UILabel!
    @IBOutlet weak var buttonDiceLabel: UIButton!
    @IBOutlet weak var fireImageView: UIImageView!
    
    @IBOutlet weak var diceImage1: UIImageView!
    @IBOutlet weak var diceImage2: UIImageView!
    
    
    //Variables
    let diceStr = "dice"
    var appOpen: Int = 1
    var diceChange: Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        shakeLabel.isHidden = false
        
        
        //Check first launch & Checking how much time App was opened
        if UserDefaults.standard.bool(forKey: "FirstLaunch") {
            print("Not first Launch")
            var appOpenUD = UserDefaults.standard.integer(forKey: "AppOpen")
            appOpenUD = appOpenUD + appOpen
            UserDefaults.standard.set(appOpenUD, forKey: "AppOpen")
            print(appOpenUD)
            shakeLabel.isHidden = true
            buttonDiceLabel.setTitle("Shake it", for: .normal)
        }
        else {
            print("First Launch")
            UserDefaults.standard.set(true, forKey: "FirstLaunch")
            UserDefaults.standard.set(appOpen, forKey: "AppOpen")
        }


        
        
        
        //Trial Debug
        
        print("Made with 💚 Kautilya")
        let str = "Kautilya"
        
        let no = 4
        
        print ( str + String(no) )

        //: Playground - noun: a place where people can play
        let 🤓 = 713
        let 😤 = 823
        let 😇 = 🤓 + 😤
        
        print(😇)
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func rollDicePressed(_ sender: Any) {
        print("rollDicePressed")
        //Setting default Image
        fireImageView.image = UIImage(named: "fire")
        // call function
        randomDices()
        
    }
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            print("motionShake")
            shakeLabel.isHidden = true
            // call function
            randomDices()
            
        }
        else {
            print("No shakes for you today")
        }
    }
    
    // Random Logic for Dice
    func randomDices() {
        diceChange = diceChange + 1
        print(diceChange)
        //Getting random Integer values
        let randomInt1 : Int = Int(arc4random_uniform(6))
        let randomInt2 : Int = Int(arc4random_uniform(6))
        
        // Debug prints Random Dices
        print(diceStr + String(randomInt1))
        print(diceStr + String(randomInt2))
        
        // Setting images for random dice.
        diceImage1.image = UIImage(named: diceStr + String(randomInt1 + 1))
        diceImage2.image = UIImage(named: diceStr + String(randomInt2 + 1))
        
        if diceChange % 7 == 0 || diceChange % 9 == 0 {
            shakeLabel.isHidden = false
            shakeLabel.text = "SensehacK"
//            fireImageView.image = UIImage(named: "fireg")
            
            fireImageView.loadGif(name: "fireg")
        }
        else {
            shakeLabel.isHidden = true
        }
    }

}

