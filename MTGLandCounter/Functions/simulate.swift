//
//  simulate.swift
//  MTGLandCounter
//
//  Created by Marcin Zyga on 22/05/2020.
//  Copyright © 2020 Marcin Zyga. All rights reserved.
//

import Foundation

func simulate(
    goodLandsWanted         : Int,
    totalLandsWanted        : Int,
    landsRange              : ClosedRange<Int>,
    additionalTurnsRange    : ClosedRange<Int>,
    cardsInDeck             : Int,
    isPlayerOnPlay          : Bool = true,
    numberOfIterations      : NumberOfIterationsSize = .fastIterations
)-> [SimulationResult]
{
    
    let testSuit = DrawSimulationSuit(
        goodLandsWanted: goodLandsWanted,
        totalLandsWanted: totalLandsWanted,
        landsRange: landsRange,
        additionalTurnsRange: additionalTurnsRange,
        cardsInDeck: cardsInDeck,
        isOnPlay: isPlayerOnPlay,
        numberOfIterations: numberOfIterations
    )

    testSuit.runSimulationSuit()
    return testSuit.simulationSuitResults!
}
