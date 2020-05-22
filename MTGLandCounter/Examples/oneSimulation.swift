//
//  oneSimulation.swift
//  MTGLandCounter
//
//  Created by Marcin Zyga on 22/05/2020.
//  Copyright © 2020 Marcin Zyga. All rights reserved.
//

import Foundation

/*
 Run simulation of drawing colored sources with these parameters:
 
 Number of colored sources in deck: 17 (goodLands)
 Number of total lands in deck: 29 (overallLands)
 Number of cards in deck: 60 (totalCards)
 
 We want to cast a spell 2CC (2 generic and two colored sources) by turn 4 (upToTheTurnNumber).
 We are assuming we are on the play (isPlayerOnPlay). We are calculating the odds of drawing our
 colored sources so we are able to cast spell with mentioned mana cost on specific turn. The simulation skips
 all games where you did not draw enough lands. We are playing multiple games (numberOfIterations) and calculating
 the number of good games vs total games (excluding non games, i.e. mulligan to 0).
 
 */
func oneSimulation() {
    let simulation = DrawSimulation(
            deck: Deck( goodLands: 17,
                        overallLands: 29,
                        totalCards: 60
                        ),
            goodLandsWanted: 2,
            totalLandsWanted: 4,
            upToTheTurnNumber: 4,
            isPlayerOnPlay: true,
            numberOfIterations: .fastIterations
    )
    let result = simulation.run()
    result.printResult()
}
