//
//  Concentration.swift
//  ConcentrationApp
//
//  Created by Sonali Patel on 4/24/18.
//  Copyright © 2018 Sonali Patel. All rights reserved.
//

import Foundation

class Concentration {
    
  // var cards = Array<Card>()
    var cards = [Card]()
    
    var indexOfOneAndOnlyFaceUpCard : Int?
    
    func chooseCard(at index: Int) {
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                // check if cards match
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = nil
            } else {
                // either no cards or two cards are face up
                for flipDownIndex in cards.indices {
                    cards[flipDownIndex].isFaceUp = false
                }
                
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
    
    init(numberOfPairOfCards: Int) {
        //Countable Range
        // for identifier in 0...numberOfPairOfCards it starts from 0 and includes numberOfPairOfCards
        
        for _ in 0 ..< numberOfPairOfCards {
            let card = Card()
      //  cards.append(card)
       // cards.append(card)
        cards += [card, card]
        }
    }
    
    //TODO: Shuffle the cards
    
}
