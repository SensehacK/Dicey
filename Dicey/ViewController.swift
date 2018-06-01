//
//  ViewController.swift
//  Dicey
//
//  Created by Kautilya on 31/05/18.
//  Copyright © 2018 Kautilya. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var shakeLabel: UILabel!
    
    //IBOutlets
    @IBOutlet weak var diceImage1: UIImageView!
    @IBOutlet weak var diceImage2: UIImageView!
    
    
    //Variables
    let diceStr = "dice"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        shakeLabel.isHidden = false
        
        //Check first launch
        if UserDefaults.standard.bool(forKey: "FirstLaunch") {
            print("Not first Launch")
            shakeLabel.isHidden = true
        }
        else {
            print("First Launch")
            UserDefaults.standard.set(true, forKey: "FirstLaunch")
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
        // call function
        randomDices()
    }
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            print("motionShake")
            // call function
            randomDices()
            shakeLabel.isHidden = true
        }
        else {
            print("No shakes for you today")
        }
    }
    
    // Random Logic for Dice
    func randomDices() {
        //Getting random Integer values
        let randomInt1 : Int = Int(arc4random_uniform(6))
        let randomInt2 : Int = Int(arc4random_uniform(6))
        
        // Debug prints Random Dices
        print(diceStr + String(randomInt1))
        print(diceStr + String(randomInt2))
        
        // Setting images for random dice.
        diceImage1.image = UIImage(named: diceStr + String(randomInt1 + 1))
        diceImage2.image = UIImage(named: diceStr + String(randomInt2 + 1))
    }

}

