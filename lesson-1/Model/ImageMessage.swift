//
//  TextMessage.swift
//  lesson-1
//
//  Created by dev Darius on 14/07/2022.
//

import Foundation
import SwiftUI

struct ImageMessage: Hashable {
    var direction: String
    var timestamp: Int
    var senderID: String
    var destinationID: String
    var imageURL: String
    var thumbnailURL: String
    var deliveryStatus: String
    var deliveryTimestamp: Int
}
