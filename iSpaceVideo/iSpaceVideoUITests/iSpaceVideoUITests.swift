//
//  iSpaceVideoUITests.swift
//  iSpaceVideoUITests
//
//  Created by Eugene Berezin on 10/7/20.
//

import XCTest

/*
 This is an example of UI test for my app.
 Lucky UI test work exactly the same as they do in UIKit so nothing new there.
 For my UI test I use Page Object Model that I have modified for the iOS infrastructure.
For each screen (or ф group of screens) I create a Screen Object Model that would contain all the XCUIQueries for for each element that I use. Each object model would contain static methods that we can use for the most common actions.
 Think about Page Object Model as a View Model but for UI tests. 
 
 */

class iSpaceVideoUITests: XCTestCase {

    override func setUpWithError() throws {
        let app = XCUIApplication()
        app.launch()
        continueAfterFailure = false
    }

    override func tearDownWithError() throws {
        if ContentScreenObjectModel.StaticTexts.moonFirstSearchResult.exists {
            ContentScreenObjectModel.deleteVideo()
        }
    }

    func testUIElements() throws {
        XCTAssert(ContentScreenObjectModel.TextFields.searchBar.exists)
        XCTAssert(ContentScreenObjectModel.Images.nightSky.exists)
        XCTAssert(ContentScreenObjectModel.StaticTexts.searchForVideos.exists)
        XCTAssert(ContentScreenObjectModel.Buttons.backgroundImage.exists)
        XCTAssert(ContentScreenObjectModel.Buttons.savedVideos.exists)
        XCTAssert(ContentScreenObjectModel.Buttons.savedVideos.exists)
    }
    
    func testSearchBar() throws {
        ContentScreenObjectModel.searchForVideos(searchTerm: "Moon")
        XCTAssert(ContentScreenObjectModel.Buttons.cancel.exists)
        XCTAssert(ContentScreenObjectModel.Buttons.deleteText.exists)
        // This part is kind of hard test. Because it's hard to get the actual text of the text field. Especially in SwiftUI.
        ContentScreenObjectModel.Buttons.deleteText.tap()
        ContentScreenObjectModel.searchForVideos(searchTerm: "Moon")
        ContentScreenObjectModel.Buttons.cancel.tap()
        XCTAssert(ContentScreenObjectModel.Images.nightSky.exists)
    }
    
    func testSearchForVideo() {
        //XCUITest has a weird bug when it does not type all the text through sometimes. It could be a new XCode bug. I haven't seen it in UIKit apps.
        ContentScreenObjectModel.searchForVideos(searchTerm: "Moon")
        XCTAssert(ContentScreenObjectModel.StaticTexts.moonFirstSearchResult.waitForExistence(timeout: 7))
    }
    
    func testSearchAndSave() {
        //XCUITest has a weird bug when it does not type all the text through sometimes. It could be a new XCode bug. I haven't seen it in UIKit apps. 
        ContentScreenObjectModel.searchForVideos(searchTerm: "Moon")
        guard ContentScreenObjectModel.StaticTexts.moonFirstSearchResult.waitForExistence(timeout: 7) else {
            XCTFail("The first result is not found")
            return
        }
        ContentScreenObjectModel.saveVideo()
        XCUIApplication().tap()
        ContentScreenObjectModel.Buttons.savedVideos.tap()
        XCTAssert(ContentScreenObjectModel.StaticTexts.moonFirstSearchResult.waitForExistence(timeout: 2))
    }
    
    func testSearchAndSaveThenDelete() {
        ContentScreenObjectModel.searchForVideos(searchTerm: "Moon")
        guard ContentScreenObjectModel.StaticTexts.moonFirstSearchResult.waitForExistence(timeout: 7) else {
            XCTFail("The first result is not found")
            return
        }
        ContentScreenObjectModel.saveVideo()
        XCUIApplication().tap()
        ContentScreenObjectModel.Buttons.savedVideos.tap()
        XCTAssert(ContentScreenObjectModel.StaticTexts.moonFirstSearchResult.waitForExistence(timeout: 2))
        ContentScreenObjectModel.deleteVideo()
        
    }


}
