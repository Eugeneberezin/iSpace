//
//  SearchViewScreenObjectModel.swift
//  iSpaceVideoUITests
//
//  Created by Eugene Berezin on 10/13/20.
//

import XCTest

class ContentScreenObjectModel {
    
    enum TextFields {
        static let searchBar = XCUIApplication().textFields["Search ..."]
    }
    
    enum Buttons {
        static let bookmarkFirst = XCUIApplication().scrollViews.children(matching: .button).matching(identifier: "bookmark.fill").element(boundBy: 0)
        static let delete = XCUIApplication().scrollViews.children(matching: .button).matching(identifier: "trash.fill").element(boundBy: 0)
        static let cancel = XCUIApplication().buttons["Cancel"]
        static let deleteText = XCUIApplication().buttons["multiply.circle.fill"]
        static let backgroundImage = XCUIApplication().images["nightSky"]
        static let savedVideos = XCUIApplication().tabBars["Tab Bar"].buttons["list.dash"]
        static let searchedVideos = XCUIApplication().tabBars["Tab Bar"].buttons["play.rectangle"]
    }
    
    enum StaticTexts {
        static let moonFirstSearchResult = XCUIApplication().staticTexts["Go Forward to the Moon"]
        static let searchForVideos = XCUIApplication().staticTexts["Search for Nasa Videos"]
    }
    
    enum Images {
        static let nightSky = XCUIApplication().images["nightSky"]
    }
    
    static func searchForVideos(searchTerm: String) {
        TextFields.searchBar.tap()
        TextFields.searchBar.typeText(searchTerm)
    }
    
    static func saveVideo() {
        Buttons.bookmarkFirst.tap()
    }
    
    static func deleteVideo() {
        Buttons.delete.tap()
    }
    
}
