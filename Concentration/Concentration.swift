//
//  Concentration.swift
//  Concentration
//
//  Created by Mahesh Kumaran on 17/08/18.
//  Copyright © 2018 Mahesh Kumaran. All rights reserved.
//

import Foundation

class Concentration {
    
    // Whenever designing a class ,  list out all the public API's to be used
    
    
    var cards = [Card]()
    var indexOfOneAndOnlyFaceUpCard : Int?
    
    func chooseCard(at index: Int){
        
        if  !cards[index].isMatched{
            
            if let matchIndex  = indexOfOneAndOnlyFaceUpCard,matchIndex != index{
                
                if cards[matchIndex].identifier == cards[index].identifier{
                    print("CArds Matching")
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = nil
                
            }else {
                
                for flipDownIndex in cards.indices{
                    cards[flipDownIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = index
                
            }
        }
    }
    
    
    
    init(numberOfPairOfCards : Int ) {
        
        for _ in 1...numberOfPairOfCards{
            let card = Card()
            cards += [card , card]
        }
        
        cards.shuffle()
    

    }
    
}

extension MutableCollection {
    /// Shuffles the contents of this collection.
    mutating func shuffle() {
        let c = count
        guard c > 1 else { return }
        
        for (firstUnshuffled, unshuffledCount) in zip(indices, stride(from: c, to: 1, by: -1)) {
            // Change `Int` in the next line to `IndexDistance` in < Swift 4.1
            let d: Int = numericCast(arc4random_uniform(numericCast(unshuffledCount)))
            let i = index(firstUnshuffled, offsetBy: d)
            swapAt(firstUnshuffled, i)
        }
    }
}
