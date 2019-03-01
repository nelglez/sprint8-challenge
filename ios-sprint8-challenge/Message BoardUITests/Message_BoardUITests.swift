//
//  Message_BoardUITests.swift
//  Message BoardUITests
//
//  Created by Spencer Curtis on 9/14/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest

class Message_BoardUITests: XCTestCase {
    
    private var app = XCUIApplication()
    
    var threadCellAdd: XCUIElement {
        return app.textFields["MessageThreadsTableViewController.TextField"]
    }
    
    var threadCell: XCUIElement {
        return app.tables.cells.staticTexts["MessageThreadsTableViewController.Cell"]
    }
    
    private func cellAt(_ index: Int) -> XCUIElement {
        let cell = app.cells.element(boundBy: index)
        return cell
    }
        
    override func setUp() {
        super.setUp()

        // KEEP THIS SETUP FUNCTION EXACTLY AS IS.
        
        continueAfterFailure = false
        
    //    let app = XCUIApplication()
        
        app.launchArguments = ["UITesting"]
        app.launch()
    }
    
    func testCreatingANewMessage() {
        
        let table = app.tables
        let createNewThread = table.textFields["Create a new thread:"]
        createNewThread.tap()
        XCTAssertTrue(table.count > 0)
  
    }
    
    func testSomeInfoOnACell() {
        
        
        XCTAssertEqual(app.tables.cells.count, 0)
    
        XCTAssert(app.tables.staticTexts.count > 0)
    
        
    }
    
    func testAddNewMessage() {
        
        threadCellAdd.tap()
        threadCellAdd.typeText("A new message\n")
        XCTAssertTrue(cellAt(0).exists)
    }
    
}
