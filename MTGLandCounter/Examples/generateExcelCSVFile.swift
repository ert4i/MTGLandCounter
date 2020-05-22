//
//  generateExcelCSVExample.swift
//  MTGLandCounter
//
//  Created by Marcin Zyga on 22/05/2020.
//  Copyright © 2020 Marcin Zyga. All rights reserved.
//

import Foundation
import CSV

struct Consts{
    let cardsInDeck = 60
    let landsInRange = 6...29
    let additionalTurnsRange = 0...0
    let isOnPlay = true
    let filePath = "~/simulation.csv" //TODO: fill me please
}


func generateExcelCSVFile() {
    var allSimulationArray = [[SimulationResult]]()

    //Run experiment for C
    allSimulationArray.append( simulate(
        goodLandsWanted: 1,
        totalLandsWanted: 1,
        landsRange: Consts().landsInRange,
        additionalTurnsRange: Consts().additionalTurnsRange,
        cardsInDeck: Consts().cardsInDeck
    ))
    print("-----\n")

    //Run experiment for 1C
    allSimulationArray.append( simulate(
        goodLandsWanted: 1,
        totalLandsWanted: 2,
        landsRange: Consts().landsInRange,
        additionalTurnsRange: Consts().additionalTurnsRange,
        cardsInDeck: Consts().cardsInDeck
    ))
    print("-----\n")

    //Run experiment for CC
    allSimulationArray.append( simulate(
        goodLandsWanted: 2,
        totalLandsWanted: 2,
        landsRange: Consts().landsInRange,
        additionalTurnsRange: Consts().additionalTurnsRange,
        cardsInDeck: Consts().cardsInDeck
    ))
    print("-----\n")

    //Run experiment for 2C
    allSimulationArray.append( simulate(
        goodLandsWanted: 1,
        totalLandsWanted: 3,
        landsRange: Consts().landsInRange,
        additionalTurnsRange: Consts().additionalTurnsRange,
        cardsInDeck: Consts().cardsInDeck
    ))
    print("-----\n")

    //Run experiment for 1CC
    allSimulationArray.append( simulate(
        goodLandsWanted: 2,
        totalLandsWanted: 3,
        landsRange: Consts().landsInRange,
        additionalTurnsRange: Consts().additionalTurnsRange,
        cardsInDeck: Consts().cardsInDeck
    ))
    print("-----\n")

    //Run experiment for CCC
    allSimulationArray.append( simulate(
        goodLandsWanted: 3,
        totalLandsWanted: 3,
        landsRange: Consts().landsInRange,
        additionalTurnsRange: Consts().additionalTurnsRange,
        cardsInDeck: Consts().cardsInDeck
    ))
    print("-----\n")

    //Run experiment for 3C
    allSimulationArray.append( simulate(
        goodLandsWanted: 1,
        totalLandsWanted: 4,
        landsRange: Consts().landsInRange,
        additionalTurnsRange: Consts().additionalTurnsRange,
        cardsInDeck: Consts().cardsInDeck
    ))
    print("-----\n")

    //Run experiment for 2CC
    allSimulationArray.append( simulate(
        goodLandsWanted: 2,
        totalLandsWanted: 4,
        landsRange: Consts().landsInRange,
        additionalTurnsRange: Consts().additionalTurnsRange,
        cardsInDeck: Consts().cardsInDeck
    ))
    print("-----\n")

    //Run experiment for 1CCC
    allSimulationArray.append( simulate(
        goodLandsWanted: 3,
        totalLandsWanted: 4,
        landsRange: Consts().landsInRange,
        additionalTurnsRange: Consts().additionalTurnsRange,
        cardsInDeck: Consts().cardsInDeck
    ))
    print("-----\n")

    //Run experiment for 4C
    allSimulationArray.append( simulate(
        goodLandsWanted: 1,
        totalLandsWanted: 5,
        landsRange: Consts().landsInRange,
        additionalTurnsRange: Consts().additionalTurnsRange,
        cardsInDeck: Consts().cardsInDeck
    ))
    print("-----\n")

    //Run experiment for 3CC
    allSimulationArray.append( simulate(
        goodLandsWanted: 2,
        totalLandsWanted: 5,
        landsRange: Consts().landsInRange,
        additionalTurnsRange: Consts().additionalTurnsRange,
        cardsInDeck: Consts().cardsInDeck
    ))
    print("-----\n")

    //Run experiment for 2CCC
    allSimulationArray.append( simulate(
        goodLandsWanted: 3,
        totalLandsWanted: 5,
        landsRange: Consts().landsInRange,
        additionalTurnsRange: Consts().additionalTurnsRange,
        cardsInDeck: Consts().cardsInDeck
    ))
    print("-----\n")

    //Run experiment for 5C
    allSimulationArray.append( simulate(
        goodLandsWanted: 1,
        totalLandsWanted: 6,
        landsRange: Consts().landsInRange,
        additionalTurnsRange: Consts().additionalTurnsRange,
        cardsInDeck: Consts().cardsInDeck
    ))
    print("-----\n")

    //Run experiment for 4CC
    allSimulationArray.append( simulate(
        goodLandsWanted: 2,
        totalLandsWanted: 6,
        landsRange: Consts().landsInRange,
        additionalTurnsRange: Consts().additionalTurnsRange,
        cardsInDeck: Consts().cardsInDeck
    ))
    print("-----\n")

    //Run experiment for 3CCC
    allSimulationArray.append( simulate(
        goodLandsWanted: 3,
        totalLandsWanted: 6,
        landsRange: Consts().landsInRange,
        additionalTurnsRange: Consts().additionalTurnsRange,
        cardsInDeck: Consts().cardsInDeck
    ))
    print("-----\n")

    //Write down results:
    let stream = OutputStream(toFileAtPath: Consts().filePath, append: false)!
    let csv = try! CSVWriter(stream: stream)

    try! csv.write(row: [
        "Sources",
        "C",
        "1C",
        "CC",
        "2C",
        "1CC",
        "CCC",
        "3C",
        "2CC",
        "1CCC",
        "4C",
        "3CC",
        "2CCC",
        "5C",
        "4CC",
        "3CCC"
    ])

    for index in 0...allSimulationArray[0].count - 1 {
        try! csv.write(
            row: [
                "\(allSimulationArray[0][index].goodLandsCount)",
                "\(allSimulationArray[0][index].percentageOfMetCriteria)",
                "\(allSimulationArray[1][index].percentageOfMetCriteria)",
                "\(allSimulationArray[2][index].percentageOfMetCriteria)",
                "\(allSimulationArray[3][index].percentageOfMetCriteria)",
                "\(allSimulationArray[4][index].percentageOfMetCriteria)",
                "\(allSimulationArray[5][index].percentageOfMetCriteria)",
                "\(allSimulationArray[6][index].percentageOfMetCriteria)",
                "\(allSimulationArray[7][index].percentageOfMetCriteria)",
                "\(allSimulationArray[8][index].percentageOfMetCriteria)",
                "\(allSimulationArray[9][index].percentageOfMetCriteria)",
                "\(allSimulationArray[10][index].percentageOfMetCriteria)",
                "\(allSimulationArray[11][index].percentageOfMetCriteria)",
                "\(allSimulationArray[12][index].percentageOfMetCriteria)",
                "\(allSimulationArray[13][index].percentageOfMetCriteria)",
                "\(allSimulationArray[14][index].percentageOfMetCriteria)"
        ])
    }

    csv.stream.close()
}
