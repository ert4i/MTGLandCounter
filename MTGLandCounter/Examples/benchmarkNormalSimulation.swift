//
//  benchmarkNormalSimulation.swift
//  MTGLandCounter
//
//  Created by Marcin Zyga on 22/05/2020.
//  Copyright © 2020 Marcin Zyga. All rights reserved.
//

import Foundation


/*
 Benchmark for measuring how long it takes for computer to calculate simulation with parameters:
 
 Deck size: 60 cards
 Colored sources: between 6 and 29
 For turn: no additional turns so 1st turn
 
 */
func benchmarkNormalSimulation() {
    printTimeElapsedWhenRunningCode(title:"1m Experiment") {
        let _ = simulate(
            goodLandsWanted: 1,
            totalLandsWanted: 1,
            landsRange: 6...29,
            additionalTurnsRange: 0...0,
            cardsInDeck: 60
        )
    }
}
