//
//  RandomNumber.swift
//  FinalStarterSpring2020
//
//  Created by David Gerstl on 05/08/2020.
//  Copyright © 2020 David Gerstl. All rights reserved.reserved.
//

import Foundation

class RandomNumber {
    // returns a random number between 0 and upperBound
    func returnRandomNumber(upperBound: Int)->Int {
        if upperBound > 0 {
            let unsignedBound = UInt32(upperBound)
            let randomNum:UInt32 = arc4random_uniform(unsignedBound)
            return Int(randomNum)
        }
        return 0
    }
}
