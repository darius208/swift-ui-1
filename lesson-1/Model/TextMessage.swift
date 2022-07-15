//
//  Text.swift
//  lesson-1
//
//  Created by dev Darius on 14/07/2022.
//

import Foundation


struct TextMessage: Hashable {
    var direction: String
    var timestamp: Int
    var senderID: String
    var destinationID: String
    var message: String
    var deliveryStatus: String
    var deliveryTimestamp: Int
}
