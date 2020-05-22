//
//  DrawSimulationSuit.swift
//  MTGLandCounter
//
//  Created by Marcin Zyga on 18/05/2020.
//  Copyright © 2020 Marcin Zyga. All rights reserved.
//

import Foundation

class DrawSimulationSuit {

    var landsRange : ClosedRange<Int>
    var additionalTurnsRange : ClosedRange<Int>
    var cardsInDeck : Int
    var goodLandsWanted : Int
    var totalLandsWanted : Int
    var isOnPlay : Bool
    var numberOfIterations: NumberOfIterationsSize
    var verbose : Bool = true
    
    private(set) var simulationSuitResults: [SimulationResult]? = nil
    
    init(
        goodLandsWanted         : Int,
        totalLandsWanted        : Int,
        landsRange              : ClosedRange<Int>,
        additionalTurnsRange    : ClosedRange<Int>,
        cardsInDeck             : Int,
        isOnPlay                : Bool,
        numberOfIterations      : NumberOfIterationsSize
    ) {
        
        self.goodLandsWanted = goodLandsWanted
        self.totalLandsWanted = totalLandsWanted
        self.landsRange = landsRange
        self.additionalTurnsRange = additionalTurnsRange
        self.cardsInDeck = cardsInDeck
        self.isOnPlay = isOnPlay
        self.numberOfIterations = numberOfIterations
    }
    
    init(
        goodLandsWanted         : Int,
        totalLandsWanted        : Int,
        landsRange              : ClosedRange<Int>,
        additionalTurnsRange    : ClosedRange<Int>,
        cardsInDeck             : Int,
        isOnPlay                : Bool,
        numberOfIterations      : NumberOfIterationsSize,
        verbose                 : Bool
    ) {
        
        self.goodLandsWanted = goodLandsWanted
        self.totalLandsWanted = totalLandsWanted
        self.landsRange = landsRange
        self.additionalTurnsRange = additionalTurnsRange
        self.cardsInDeck = cardsInDeck
        self.isOnPlay = isOnPlay
        self.numberOfIterations = numberOfIterations
        self.verbose = verbose
    }
    
    
    
    func runSimulationSuit() {
        
        self.simulationSuitResults = [SimulationResult]()
        
        for goodLands in landsRange {
            
            for addTurn in additionalTurnsRange {
                let simulation = DrawSimulation(
                        deck: Deck( goodLands: goodLands,
                                    overallLands: landsRange.last!,
                                    totalCards: cardsInDeck
                                    ),
                        goodLandsWanted: goodLandsWanted,
                        totalLandsWanted: totalLandsWanted,
                        upToTheTurnNumber: totalLandsWanted + addTurn,
                        isPlayerOnPlay: self.isOnPlay,
                        numberOfIterations: self.numberOfIterations
                )
                let result = simulation.run()
                if verbose {
                    print("-------\n")
                    print("For " +
                            manaStringConverter(coloredSources: goodLandsWanted, totalSources: totalLandsWanted) +
                         "in turn \(totalLandsWanted + addTurn) \n"
                    )
                    result.printResult()
                    print("-------\n")
                }
                self.simulationSuitResults?.append(result)
            }
        }
        
    }
}
