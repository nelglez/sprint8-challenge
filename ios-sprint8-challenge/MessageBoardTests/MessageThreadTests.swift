//
//  MessageThreadTests.swift
//  MessageBoardTests
//
//  Created by Andrew R Madsen on 9/13/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest
@testable import Message_Board

class MessageThreadTests: XCTestCase {
    
    private var controller: MessageThreadController!
    private var messageThread: MessageThread!
    
    override func setUp() {
        controller = MessageThreadController()
        messageThread = MessageThread(title: "Testing the message thread")
    }
    
    func testCreateANewLocalMessageThread() {
       
       controller.messageThreads.append(messageThread)
        controller.createLocalMessage(in: messageThread, withText: "This is Nelson", sender: "Nelson G.") {
            XCTAssertTrue(!self.controller.messageThreads.isEmpty)
        }

    }
    
    func testFetchingAllMessage() {
        controller.fetchMessageThreads {
            XCTAssert(self.controller.messageThreads.count > 0)
        }
    }
    
    func testCreatingANewMessageThread() {
        controller.createMessageThread(with: "This is Nelson") {
            XCTAssertTrue(!self.controller.messageThreads.isEmpty)
        }
    }
    
}
