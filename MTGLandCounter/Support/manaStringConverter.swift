//
//  manaStringConverter.swift
//  MTGLandCounter
//
//  Created by Marcin Zyga on 22/05/2020.
//  Copyright © 2020 Marcin Zyga. All rights reserved.
//

import Foundation

func manaStringConverter(coloredSources: Int, totalSources: Int) -> String {
    
    var manaString = "\(totalSources-coloredSources)"
    
    for _ in 1...coloredSources {
        manaString += "C"
    }
    
    return manaString
}
