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
    @IBOutlet weak var diceImage1: UIImageView!
    @IBOutlet weak var diceImage2: UIImageView!
    
    
    //Variables
    let diceStr = "dice"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //Trial Debug
        
        print("Made with 💚 Kautilya")
        let str = "Kautilya"
        
        let no = 4
        
        print ( str + String(no) )
        
        
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

