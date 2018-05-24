//
//  ConcentrationViewController.swift
//  ConcentrationApp
//
//  Created by Sonali Patel on 11/28/17.
//  Copyright © 2017 Sonali Patel. All rights reserved.
//

import UIKit

class ConcentrationViewController: VCLLoggingViewController
{
    
    override var vclLoggingName: String {
        return "Game"
    }
    
    @IBOutlet private var cardButtons: [UIButton]!
    @IBOutlet private weak var flipCountLbl: UILabel! {
        didSet {
            updateFlipCountLbl()
        }
    }
    
    private (set) var flipCount = 0 {
        //Property observer
        didSet {
            updateFlipCountLbl()
        }
    }
    
    private func updateFlipCountLbl() {
        let attributes: [NSAttributedStringKey:Any] = [
            .strokeWidth : 5.0,
            .strokeColor :  #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        ]
        let attributedString = NSAttributedString(string: "Flips: \(flipCount)", attributes: attributes)
        flipCountLbl.attributedText = attributedString
    }
  //  private var emojiChoices = ["🎃", "👻", "😈" ,"👹", "🤖", "🤡", "💩", "🧚‍♀️", "😘", "🤪", "🤮", "👺"]
    private var emojiChoices = "🎃👻😈👹🤖🤡💩🧚‍♀️"
    private lazy var game = Concentration(numberOfPairOfCards:(cardButtons.count + 1 / 2))
    
    
    
    @IBAction private func touchCard(_ sender: UIButton) {
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
   
    private func updateViewFromModel() {
        if cardButtons != nil {
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card =  game.cards[index]
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: UIControlState.normal)
                button.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
            } else {
                    button.setTitle("", for: UIControlState.normal)
                button.backgroundColor = card.isMatched ?  #colorLiteral(red: 1, green: 0.5781051517, blue: 0, alpha: 0) : #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)
            }
            
        }
            
    }
    }
    var theme: String? {
        didSet {
            emojiChoices = theme ?? ""
            emoji = [:]
            updateViewFromModel()
        }
    }
    
    private var emoji = [Card: String] ()
    
    private func emoji(for card: Card) -> String {
        if emoji[card] == nil, emojiChoices.count > 0 {
            let randomStringIndex = emojiChoices.index(emojiChoices.startIndex, offsetBy: emojiChoices.count.arc4random)
                emoji[card] = String(emojiChoices.remove(at: randomStringIndex ))
            }
        return emoji[card] ?? "?"
        
    }
    
}

extension Int {
    var arc4random: Int {
        if self > 0 {
            return Int(arc4random_uniform(UInt32(self)))
        } else if self < 0 {
            return -Int(arc4random_uniform(UInt32(abs (self))))
        } else {
            return 0
        }
    }
}
