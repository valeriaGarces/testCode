//
//  HalfTunesTests2.swift
//  HalfTunesTests2
//
//  Created by Valeria on 06/10/17.
//  Copyright © 2017 Ray Wenderlich. All rights reserved.
//

import XCTest
@testable import HalfTunes
var controllerTest: SearchViewController!

class HalfTunesTests2: XCTestCase {
    
    override func setUp() {
        super.setUp()
        controllerTest = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController() as! SearchViewController!
        
        let testBundle = Bundle(for: type(of: self))
        let path = testBundle.path(forResource: "abbaData", ofType: "json")
        let data = try? Data(contentsOf: URL(fileURLWithPath: path!), options: .alwaysMapped)
        
        let url = URL(string: "https://itunes.apple.com/search?media=music&entity=song&term=abba")
        let urlRespone = HTTPURLResponse(url: url!, statusCode: 200, httpVersion: nil, headerFields: nil)
        let sessionMock = URLSessionMock(data: data, response: urlRespone, error: nil)
        
        controllerTest.defaultSession = sessionMock
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        func test_UpdateSearchResults_ParsesData() {
            //given
            let promise = expectation(description: "status code 200")
            
            
            // when
            XCTAssertEqual(controllerTest?.searchResults.count, 0, "saerchResults deberia estar vacio despues de que el data task corra")
            
            let url = URL(string: "https://itunes.apple.com/search?media=music&entity=song&term=abba")
            
            
            
            
            XCTAssertEqual(controllerTest?.defaultSession.dataTask(with: url!) {
            data, response , error in
                // si el http response es successful, se llama a updateSearchResults(_:) que parsea la respuesta en informacion para rastreo
            if let error = error {
                print(error.localizedDescription)

            }
            )
            
            
        }
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
