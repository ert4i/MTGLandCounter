//
//  Deck.swift
//  MTGLandCounter
//
//  Created by Marcin Zyga on 18/05/2020.
//  Copyright © 2020 Marcin Zyga. All rights reserved.
//

import Foundation

class Deck {
    var numberOfLands : Int
    var numberOfGoodLands : Int
    var numberOfCards : Int
    
    private var startingNumberOfLands : Int
    private var startingNumberOfGoodLands : Int
    private var startingNumberOfCards : Int 
    
    init(goodLands: Int, overallLands: Int, totalCards: Int) {
        self.numberOfLands = overallLands
        self.numberOfGoodLands = goodLands
        self.numberOfCards = totalCards
        
        self.startingNumberOfCards = self.numberOfCards
        self.startingNumberOfGoodLands = self.numberOfGoodLands
        self.startingNumberOfLands = self.numberOfLands
    }
    
    func drawCard () -> Card {
        let random = Int.random(in: 1...self.numberOfCards)
        if random <= self.numberOfGoodLands {
            
            self.numberOfLands -= 1
            self.numberOfGoodLands -= 1
            self.numberOfCards -= 1
            
            return Card(type: .goodLand)
            
        }else if random > self.numberOfGoodLands && random <= self.numberOfLands {
            
            self.numberOfLands -= 1
            self.numberOfCards -= 1
            
            return Card(type:.land)
        }
                
        self.numberOfCards -= 1
        return Card(type: .nonLand)
    }
    
    func reshuffleDeck() {
        self.numberOfCards = self.startingNumberOfCards
        self.numberOfGoodLands = self.startingNumberOfGoodLands
        self.numberOfLands = self.startingNumberOfLands
    }
}
