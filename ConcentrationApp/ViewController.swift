//
//  ViewController.swift
//  ConcentrationApp
//
//  Created by Sonali Patel on 11/28/17.
//  Copyright © 2017 Sonali Patel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var flipCount = 0 {
        //Property observer
        didSet {
             flipCountLbl.text = "Flips: \(flipCount)"
        }
    }
   
    @IBOutlet var cardButtons: [UIButton]!
    
    @IBOutlet weak var flipCountLbl: UILabel!
    
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardButtons.index(of: sender) {
        print("Card Number = \(cardNumber)")
        } else {
            print("Card is not connected")
        }
        flipcard(withEmoji: "👻", on: sender)
    }
   
  
    func flipcard(withEmoji emoji: String, on button: UIButton) {
        if button.currentTitle == emoji {
            button.setTitle("", for: UIControlState.normal)
            button.backgroundColor = #colorLiteral(red: 0.9411764741, green: 0.5203595311, blue: 0.3002130919, alpha: 1)
            }
        else {
            button.setTitle(emoji, for: UIControlState.normal)
            button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        }
    
    }

}

