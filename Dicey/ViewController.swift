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
    var fireIVW = 0.0
    var fireIVH = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //Initialize function
        initializeUI()
        
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
    
    func initializeUI() {
        shakeLabel.isHidden = false
        fireIVW = Double(fireImageView.frame.size.width)
        fireIVH = Double(fireImageView.frame.size.height)
        print("fireIVW", fireIVW)
        print("fireIVH", fireIVH)
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
        
        if diceChange % 7 == 0 {
            easterEggUI()
            shakeLabel.text = "SensehacK"
//            fireImageView.autoresizingMask = .None
        }
        else if diceChange % 8 == 0  {
            easterEggUI()
            shakeLabel.text = "Adhvazila.in"
        }
        else {
            shakeLabel.isHidden = true
            //Setting default Image function
            normalFireImageView()
        }
    }
    
    func normalFireImageView() {
        print("Debug fire Image view width & height")
        print(fireIVW)
        print(fireIVH)
        fireImageView.frame.size.width = CGFloat(fireIVW)
        fireImageView.frame.size.height = CGFloat(fireIVH)
        fireImageView.contentMode = UIViewContentMode.scaleAspectFit
        fireImageView.image = UIImage(named: "fire")
        
    }
    
    func easterEggUI() {
        shakeLabel.isHidden = false
        fireImageView.frame.size.width = CGFloat(fireIVW + 20)
        fireImageView.frame.size.height = CGFloat(fireIVH + 20)
        fireImageView.loadGif(name: "fireg")
        fireImageView.contentMode = UIViewContentMode.bottom
    }

}

