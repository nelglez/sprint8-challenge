//
//  MessageThread.swift
//  Message Board
//
//  Created by Spencer Curtis on 8/7/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation

class MessageThread: Codable, Equatable {

    let title: String
    var messages: [MessageThread.Message]
    let identifier: String

    init(title: String, messages: [MessageThread.Message] = [], identifier: String = UUID().uuidString) {
        self.title = title
        self.messages = messages
        self.identifier = identifier
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        let title = try container.decode(String.self, forKey: .title)
        let identifier = try container.decode(String.self, forKey: .identifier)
        //Fixed this
        let messagesDictionary = try container.decodeIfPresent([String: Message].self, forKey: .messages) ?? [:]
        //Added this
        let messages = messagesDictionary.map {$0.value}
        
        self.title = title
        self.identifier = identifier
        self.messages = messages
    }

    
    struct Message: Codable, Equatable {
        
        let sender: String
        let messageText: String
        let timestamp: Date
        
//        enum CodingKeys: String, CodingKey {
//            case messageText = "text"
//            case sender
//            case timestamp
//        }
        
        init(text: String, sender: String, timestamp: Date = Date()) {
            self.sender = sender
            self.messageText = text
            self.timestamp = timestamp
        }
    }
    
    static func ==(lhs: MessageThread, rhs: MessageThread) -> Bool {
        return lhs.title == rhs.title &&
            lhs.identifier == rhs.identifier &&
            lhs.messages == rhs.messages
    }
}
