//
//  ViewController.swift
//  ConcentrationApp
//
//  Created by Sonali Patel on 11/28/17.
//  Copyright © 2017 Sonali Patel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
   
    @IBOutlet var cardButtons: [UIButton]!
    @IBOutlet weak var flipCountLbl: UILabel!
    
    var flipCount = 0 {
        //Property observer
        didSet {
            flipCountLbl.text = "Flips: \(flipCount)"
        }
    }
    var emojiChoices = ["🎃", "👻", "😈" ,"👹", "🤖", "🤡", "💩", "🧚‍♀️", "😘", "🤪", "🤮"]
    lazy var game = Concentration(numberOfPairOfCards:(cardButtons.count + 1 / 2))
    
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardButtons.index(of: sender) {
        print("Card Number = \(cardNumber)")
       // flipcard(withEmoji: emojiChoices[cardNumber], on: sender)
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        } else {
            print("Card is not connected")
        }
       
    }
   
    func updateViewFromModel() {
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card =  game.cards[index]
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: UIControlState.normal)
                button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            } else {
                    button.setTitle("", for: UIControlState.normal)
                button.backgroundColor = card.isMatched ?  #colorLiteral(red: 1, green: 0.5781051517, blue: 0, alpha: 0) : #colorLiteral(red: 1, green: 0.5781051517, blue: 0, alpha: 1)
                
                
            }
            
            
        }
    }
    
    var emoji = [Int : String] ()
    
    func emoji(for card: Card) -> String {
        if emoji[card.identifier] == nil, emojiChoices.count > 0 {
                let randomIndex = Int(arc4random_uniform(UInt32 (emojiChoices.count - 1)))
                emoji[card.identifier] = emojiChoices.remove(at: randomIndex)
            }
        return emoji[card.identifier] ?? "?"
        
    }
   

}

