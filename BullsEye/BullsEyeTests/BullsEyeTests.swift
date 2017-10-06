//
//  BullsEyeTests.swift
//  BullsEyeTests
//
//  Created by Valeria on 06/10/17.
//  Copyright © 2017 Ray Wenderlich. All rights reserved.
//

import XCTest
@testable import BullsEye

var gameTest: BullsEyeGame!

class BullsEyeTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        gameTest = BullsEyeGame()
        gameTest.startNewGame()
    }
    
    override func tearDown() {
        gameTest = nil
        super.tearDown()
    }
    func check(guess: Int) -> Int {
        // let difference = abs (targetValue - guess)
        let difference = guess - gameTest.targetValue
        gameTest.scoreRound  = 100 - difference
        gameTest.scoreTotal  = gameTest.scoreTotal + gameTest.scoreRound
        
        return difference
    }
        func testScoreIsComputedWhenGuessLTTarget() {
            // given
            let guess = gameTest.targetValue - 5
            
            // when
            
            _ = gameTest.check(guess: guess)
            
            // then
          //  XCTAssertEqual(gameTest.scoreRound, 95, "Score computed from guess is wrong")
            
        }
    
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
       
    }
    
}
