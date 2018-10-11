//
//  Card.swift
//  Concentration
//
//  Created by Mahesh Kumaran on 17/08/18.
//  Copyright © 2018 Mahesh Kumaran. All rights reserved.
//

import Foundation


struct Card{
    
    var isFaceUp : Bool = false
    var isMatched : Bool  = false
    var identifier : Int
    
    // Cannot sent it to a card , use it like a utility function
    
    static var identifierFactory = 0
    
    static func getUniqueIdentifier() -> Int{
        identifierFactory += 1
        return identifierFactory
    }
     
    init(){
        self.identifier = Card.getUniqueIdentifier()
        
    }
    
}
