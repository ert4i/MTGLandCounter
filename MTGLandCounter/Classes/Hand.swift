//
//  Hand.swift
//  MTGLandCounter
//
//  Created by Marcin Zyga on 18/05/2020.
//  Copyright © 2020 Marcin Zyga. All rights reserved.
//

import Foundation

typealias CountLandsInHand = (goodLands: Int, totalLands: Int)

class Hand{
    var cards = [Card]()
    
    func flushCards() {
        self.cards = [Card]()
    }
        
    func howManyLandsInHand() -> CountLandsInHand {
        var goodLands = 0
        var totalLands = 0
                
        for card in cards {
            if card.type == .goodLand {
                goodLands += 1
                totalLands += 1
            }else if card.type == .land {
                totalLands += 1
            }
        }
        
        return (goodLands, totalLands)
    }
}
