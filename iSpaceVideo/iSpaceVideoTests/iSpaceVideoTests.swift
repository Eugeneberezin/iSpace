//
//  iSpaceVideoTests.swift
//  iSpaceVideoTests
//
//  Created by Eugene Berezin on 10/7/20.
//

import XCTest
import ViewInspector
import Mocker
@testable import iSpaceVideo

/*
 Here's a very primitive start for unit tests for SwiftUI. As I was searching for the library for SwiftUI and combine I came across ViewInspector. To be honest I haven't fully wrapped my head around how this library works and what would be the right approach for the unit test.
 I provided a simple example where to start.
 
 My plan was:
 
 Test Views. Similar how we would test our View Controllers if we unit test our view controllers.
 Test functionality. On search I'd provide a mock response that I added to the repo using Mocker and if all being well we would get the responses from the mock JSON.
 I did provide UI tests that cover the essential functionality of the app.
 As I mentioned I didn't want to delay my assignment any longer and this is the point where I stopped. 
 */

class iSpaceVideoTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testNavigationViewIsNotNil() throws {
        let sut = ContentView()
        let value = try sut.inspect().navigationView()
        XCTAssertNotNil(value)
    }
    
    func testNavigationTitle() throws {
        let sut = ContentView()
        let value =  sut.navigationTitle("NASA Videos")
        XCTAssertNotNil(value)
    }
    
}

extension ContentView: Inspectable {}
