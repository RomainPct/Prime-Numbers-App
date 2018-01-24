//
//  Prime_NumbersTests.swift
//  Prime NumbersTests
//
//  Created by Romain Penchenat on 10/01/2018.
//  Copyright © 2018 Romain Penchenat. All rights reserved.
//

import XCTest
@testable import Prime_Numbers

class primeNumbersManagerTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let manager = primeNumbersManager()
        XCTAssertFalse(manager.isPrimeNumber(numberToTest: 1))
        XCTAssert(manager.isPrimeNumber(numberToTest: 2))
        XCTAssert(manager.isPrimeNumber(numberToTest: 3))
        XCTAssertFalse(manager.isPrimeNumber(numberToTest: 4))
        XCTAssertTrue(manager.isPrimeNumber(numberToTest: 5))
        XCTAssertTrue(manager.isPrimeNumber(numberToTest: 49999))
        XCTAssertFalse(manager.isPrimeNumber(numberToTest: 565363762878278272891881))
        
        XCTAssertEqual(manager.searchNextPrimeNumber(after: 99), 101)
        XCTAssertEqual(manager.searchNextPrimeNumber(after: 23474), 23497)
        
//        var lastPrimeNumber = 0
//        while true {
//            lastPrimeNumber = manager.searchNextPrimeNumber(after: lastPrimeNumber)
//            print(lastPrimeNumber)
//        }
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
