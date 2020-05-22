//
//  DrawSimulation.swift
//  MTGLandCounter
//
//  Created by Marcin Zyga on 18/05/2020.
//  Copyright © 2020 Marcin Zyga. All rights reserved.
//

import Foundation

struct SimulationResult {
    var gamesThatMetCriteria : Float = 0
    var gamesTotalWithoutNonGames : Float = 0
    var goodLandsCount : Int = 0
    var totalLandsNeeded : Int = 0
    var numberOfTurnsAllowed: Int = 0
    
    var percentageOfMetCriteria : Float{
        return self.gamesThatMetCriteria*100/self.gamesTotalWithoutNonGames
    }
    
    func printResult() {
        guard gamesTotalWithoutNonGames > 0 else {
            print ("There was no nongames")
            return
        }
        print("Proportion of good draws: \(self.percentageOfMetCriteria) %")
    }
}

enum NumberOfIterationsSize : Int {
    case veryFastIterations = 10_000
    case fastIterations = 100_000
    case normalIterations = 1_000_000
    case bigIterations = 10_000_000
}

class DrawSimulation {
    let deck : Deck
    var numberOfIterations : NumberOfIterationsSize = .normalIterations
    let numberOfGoodLandsNeeded : Int
    let numberOfTurnsAllowed : Int
    let numberOfTotalLandsNeeded : Int
    var onThePlay : Bool = true //we are on the play (skip the first draw)
    
    init(deck : Deck,
         goodLandsWanted : Int,
         totalLandsWanted : Int,
        upToTheTurnNumber: Int) {
        
        self.deck = deck
        self.numberOfGoodLandsNeeded = goodLandsWanted
        self.numberOfTurnsAllowed = upToTheTurnNumber
        self.numberOfTotalLandsNeeded = totalLandsWanted
    }
    
    init(
        deck                : Deck,
        goodLandsWanted     : Int,
        totalLandsWanted    : Int,
        upToTheTurnNumber   : Int,
        isPlayerOnPlay      : Bool,
        numberOfIterations  : NumberOfIterationsSize
        ) {
        
        self.deck = deck
        self.numberOfGoodLandsNeeded = goodLandsWanted
        self.numberOfTurnsAllowed = upToTheTurnNumber
        self.numberOfTotalLandsNeeded = totalLandsWanted
        self.onThePlay = isPlayerOnPlay
        self.numberOfIterations = numberOfIterations
    }
    
    private func drawStartingHandFromDeck(deck :Deck, mulligan: Bool = false, numberOfMulligans: Int = 0) -> Hand? {
     
        guard numberOfMulligans < 7 else {
            return nil
        }
        
        let hand = Hand()
        for _ in 1...7 {
            hand.cards.append(deck.drawCard())
        }
        
        if mulligan {
            hand.cards.sort { (firstElement, secondElement) -> Bool in
                if firstElement.type == .goodLand {
                    return true
                }
                if secondElement.type == .goodLand {
                    return false
                }
                
                if firstElement.type == .land {
                    return true
                }
                if secondElement.type == .land {
                    return false
                }
                
                return false
            }
            
            // we are droping nonland cards from hand then lands that are not good
            hand.cards = hand.cards.dropLast(numberOfMulligans)
        }
        
        return hand
    }
    
    private func checkIfMulligan(hand: Hand?) -> Bool {
        
        guard let handToConsider = hand else {
            return false //do not mulligan hands that does not exist
        }
        
        //we mull 1 landers or less and > 5 lands
        return
            handToConsider.howManyLandsInHand().totalLands < 2 ||
            handToConsider.howManyLandsInHand().totalLands > 5
                
    }
    
    func run() -> SimulationResult {
        
        var results = SimulationResult()
        
        for _ in 1...numberOfIterations.rawValue {
            var landInHand = 0
            var goodLandsInHand = 0
            
            var startingHand = self.drawStartingHandFromDeck(deck: self.deck)
            var numberOfMulligans = 0
            while self.checkIfMulligan(hand: startingHand) {
                numberOfMulligans += 1
                self.deck.reshuffleDeck()
                startingHand = self.drawStartingHandFromDeck(
                    deck: self.deck,
                    mulligan: true,
                    numberOfMulligans: numberOfMulligans
                )
            }
            
            guard let hand = startingHand else {
                self.deck.reshuffleDeck()
                continue
            }
            
                        
            for index in 1...numberOfTurnsAllowed {
                if index != 1 || !self.onThePlay {
                    hand.cards.append(self.deck.drawCard())
                }
            }
            (goodLandsInHand, landInHand) = hand.howManyLandsInHand()
            
            if landInHand < self.numberOfTotalLandsNeeded {
                self.deck.reshuffleDeck()
                continue //if you did not draw enough lands we skip
            }
            
            if  goodLandsInHand >= self.numberOfGoodLandsNeeded {
                results.gamesThatMetCriteria += 1
            }
            
            results.gamesTotalWithoutNonGames += 1
            self.deck.reshuffleDeck()
        }
        
        results.goodLandsCount = self.deck.numberOfGoodLands
        results.totalLandsNeeded = self.numberOfTotalLandsNeeded
        results.numberOfTurnsAllowed = self.numberOfTurnsAllowed
        
        return results
    }
    
}
