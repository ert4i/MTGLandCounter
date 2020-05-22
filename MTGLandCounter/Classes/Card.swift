//
//  Card.swift
//  MTGLandCounter
//
//  Created by Marcin Zyga on 18/05/2020.
//  Copyright © 2020 Marcin Zyga. All rights reserved.
//

import Foundation

enum CardType{
    case goodLand
    case land
    case nonLand
}

struct Card {
    let type: CardType
}
