//
//  HalfTunesTests.swift
//  HalfTunesTests
//
//  Created by Valeria on 06/10/17.
//  Copyright © 2017 Ray Wenderlich. All rights reserved.
//

import XCTest
@testable import HalfTunes

var sessionTest: URLSession!

class HalfTunesTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        sessionTest = URLSession(configuration: URLSessionConfiguration.default)
    }
    
    override func tearDown() {
        sessionTest = nil
        super.tearDown()
    }
//    func testCallToiTunesCompletes() {
//
//        // given
//        let url = URL(string: "https://itune.apple.com/search?media=music&entity=song&term=abba")
//        // 1
//        let promise  = expectation(description: "completion handler invoked")
//        var statusCode: Int?
//        var responseError: Error?
//
//        //when
//        let dataTask = sessionTest.dataTask(with: url!) { data, response, error in
//            statusCode = (response as? HTTPURLResponse)?.statusCode
//            responseError = error
//
//        //2
//           promise.fulfill()
//        }
//        dataTask.resume()
//
//        //3
//        waitForExpectations(timeout: 5, handler: nil)
//
//        //then
//        XCTAssertNil(responseError)
//        XCTAssertEqual(statusCode, 200)
//    }
    func testValidCallToiTunesGetsHTTPStatusCode200() {
        // given
        let url = URL(string: "https://itunes.apple.com/search?media=music&entity=song&term=abbalimit=3")
        let promise = expectation(description: "Status code: 200")

        // when
        let dataTask = sessionTest.dataTask(with: url!){data, response, error in
            if let  error = error {
                XCTFail("Error: \(error.localizedDescription)")
                return
            } else if let statusCode = (response as? HTTPURLResponse)?.statusCode {
                if statusCode == 200 {
                    promise.fulfill()
                } else {
                    XCTFail("Status code: \(statusCode)")
                }
            }
        }

        dataTask.resume()
        waitForExpectations(timeout: 10, handler: nil)
        // then

    }
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
}
