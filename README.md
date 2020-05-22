# MTGLandCounter

## Disclaimer

This project is a reimplementation of Frank Karsten's ["How many colored sources do you need? (GRN update)"](https://pastebin.com/9P5kwqt1) done in Swift 5. 

The overall aim for the project was to generate new spreadsheets showing how many colored sources are needed to consistently cast colored spells as defined in [this](https://www.channelfireball.com/all-strategy/articles/how-many-colored-mana-sources-do-you-need-to-consistently-cast-your-spells-a-guilds-of-ravnica-update/) article.

The update was needed for taking into account recent changes in the game rules (i.e., London's mulligan) and new cards (i.e., Yorion companion), which may influence how many colored sources should be played on various deck sizes (i.e., 80 cards).

This project, in its current form, is aimed at coders who would want to validate the correctness of calculated probabilities of casting spells (see _Spreadsheets links section_).

You would have to be able to read and understand [Swift's](https://docs.swift.org/swift-book/) syntax. The project was developed on macOS in Xcode IDE using Cocoa Pods as a dependency manager. 


## Getting Started

Clone the repository and familiarize yourself with the content of _main.swift_ file and source code of examples (in Examples group) invoked there **before running the project for the first time** as it may take for the program a considerable amount of time (few hours) to finish.

Installing [Cocoa Pods](https://cocoapods.org) should not be necessary as all related files were added to the GIT repository.

Use **workspace** file instead of a project to open it in Xcode!

## Source Code Overview

Main source code is divided into the following files:

* Hand.swift - implementation of holding cards in your hand
* Card.swift - we are dealing with 3 card types: colored sources (_goodLand_), lands (_land_) and nonland cards (_nonLand_)
* Deck.swift - implementation for drawing a card and shuffling the deck, as well as an overall representation of the how many cards of each type are left in the deck
* DrawSimulation.swift - class simulating drawing cards and validating whether, after a set number of turns, we would be able to cast a spell with given mana cost and a number of colored mana needed to cast it. 
* DrawSimulationSuit.swift - class for running more complex simulations for finding the probabilities for a range of turns and range of colored sources.

## Usage

The best way to start using this source code would be to read provided examples in Examples group:

* generateExcelCSVExample.swift - code for a generating CSV file that can be used to create spreadsheets with probabilities matrix. Take note of providing a valid path for the output CSV file.
* oneSimulation.swift - example of how you can use a single simulation to find the probability of casting 2CC (i.e., _Wrath of God_) spell with 17 colored sources in 29 lands in 60 cards deck on turn 4 assuming you are on the play
* benchmarkNormalSimulation.swift - a benchmark for measuring how long it takes for a computer to calculate simulation with a given set of parameters*

In order to do any simulations of your own design, you would have to write your code either in (as a new file) Examples group and referencing it in _main.swift_ or writing the code alone in the _main.swift_. 

*it is probably a good idea to run this example to check how long it would take to simulate something more complex. _Please, see note below._ 

## Note on the number of iterations for simulation
Original Frank Karsten's work took 1 million (10^6) simulations. The current code is more flexible in this manner, so you can run the simulation with a different number of iterations. 

Current options include:

* veryFastIterations - 10k (10^4) iterations - very inaccurate but very fast - probably good option to use when debugging
* fastIterations - 100k (10^5) iterations - relatively fast and accurate - most of the spreadsheets were done by using this option
* normalIterations - 1M (10^6) iterations - it may take several hours (depending on your CPU) to compute that many simulations in order to generate a full spreadsheet
* bigIterations - 10M (10^7) iterations - probably the overkill in terms of accuracy, also very slow


## What is currently possible

* You can generate probabilities for being on a play or on a draw
* You can generate probabilities for any deck size, any colored source numbers, and any land numbers. 
* You can generate probabilities for casting a spell not only on a curve but after additional turns (i.e., check the probability of casting _Wrath of God_ on turn 5 instead of 4)

## Spreadsheets links

Here is the list of links to probabilities matrix generated using this project:

* [60 cards, 29 lands, 1 M iterations](https://docs.google.com/spreadsheets/d/1kbQXQyKGVh6zUvTJMjOHbyj2PpabglA0tiaaIIXiroI/edit#gid=314767958)
* [60 cards, 29 lands, 100k iterations](https://docs.google.com/spreadsheets/d/10G92SDOSxR6rGu-22UXSNuDjIDYkh7hMOqFz_NQo-jI/edit#gid=828286429)
* [40 cards, 20 lands, 100k iterations](https://docs.google.com/spreadsheets/d/1rB4Cn_tLPNcktVHjIcuB2AGtUgAdJiW39xjyRzUlMXM/edit#gid=1524774120)
* [80 cards, 36 lands, 100k iterations](https://docs.google.com/spreadsheets/d/1exVgo1bRgAV-TqLAZ21cyB118zKfomMe9IsN1RDlApU/edit)

## ToDo

* Provide more code documentation
* Create a command-line tool for generating probabilities (so noncoders can use the tool too)
* Revalidate and simplify the syntax
* Check the project on Linux environment


## License
This project is licensed under the MIT License.

## Acknowledgments

All ideas behind the creation of spreadsheets, calculating probabilities for colored sources, etc., belong to Frank Karsten. This project is only an update of his original work in more of a decorative way than anything else.  

The project allows for usage of more options than the original source code to account for changing needs of the metagame (i.e., more than 60 cards standard legal decks).







