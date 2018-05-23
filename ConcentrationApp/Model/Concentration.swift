//
//  Concentration.swift
//  ConcentrationApp
//
//  Created by Sonali Patel on 4/24/18.
//  Copyright © 2018 Sonali Patel. All rights reserved.
//

import Foundation

struct Concentration {
    
  // var cards = Array<Card>()
    private (set) var cards = [Card]()
    
    private var indexOfOneAndOnlyFaceUpCard : Int? {
        get {
            return cards.indices.filter { cards[$0].isFaceUp }.oneAndOnly
            
//            var foundIndex: Int?
//            for index in cards.indices {
//                if cards[index].isFaceUp {
//                    if foundIndex == nil {
//                        foundIndex = index
//                    } else {
//                        return nil
//                    }
//                }
//            }
//            return foundIndex
        }
        set {
            for index in cards.indices {
                cards[index].isFaceUp = (index == newValue)
            }
            
        }
    }
    var shuffledCards = [Card]();
    
    mutating func chooseCard(at index: Int) {
        assert(cards.indices.contains(index), "Concentration.chooseCard(at: \(index)): chosen index not in the cards")
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                // check if cards match
                if cards[matchIndex] == cards[index] {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
                
            } else {
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
    
    init(numberOfPairOfCards: Int) {
        assert(numberOfPairOfCards > 0, "Concentration.init( \(numberOfPairOfCards)): you must have at least one pair of cards")
        //Countable Range
        // for identifier in 0...numberOfPairOfCards it starts from 0 and includes numberOfPairOfCards
        
        for _ in 0 ..< numberOfPairOfCards {
            let card = Card()
      //  cards.append(card)
       // cards.append(card)
        cards += [card, card]
        }
        
    }
    func shuffleArray(array: [Card]) -> [Card] {
        
        var tempArray1 = array
        var tempArray2 = [Card]()
        let indexRange = (array.count + 1) / 2
        for index in 0 ..< indexRange {
            let randomNumber = arc4random_uniform(UInt32(indexRange))
            let randomIndex = Int(randomNumber)
            tempArray2[index] = tempArray1[randomIndex]
            tempArray1.remove(at: randomIndex)
        }
        
        return tempArray2
    }
    
}

extension Collection {
    var oneAndOnly: Element? {
        return count == 1 ? first : nil
    }
}


