//
//  TextMessage.swift
//  lesson-1
//
//  Created by dev Darius on 14/07/2022.
//

import SwiftUI

struct TextMessageView: View {
    var textMessage: TextMessage
    var body: some View {
        if textMessage.direction == "Incoming" {
            ChatBubble(direction: .left) {
                Text(textMessage.message)
                    .padding(.all, 20)
                    .foregroundColor(Color.black)
                    .background( Color(UIColor(red: 240/255, green: 240/255, blue: 240/255, alpha: 1.0)))
            }
        } else if textMessage.direction == "Outbound" {
            ChatBubble(direction: .right) {
                Text(textMessage.message)
                    .padding(.all, 20)
                    .foregroundColor(Color.white)
                    .background(Color.blue)
            }
        }
    }
    
}

struct TextMessage_Previews: PreviewProvider {
    static var previews: some View {
        TextMessageView(textMessage: TextMessage(direction: "Outbound", timestamp: 1589463871, senderID: "Bob", destinationID: "Sally", message: "I was sent this message", deliveryStatus: "Delivered", deliveryTimestamp: 1589463871))
    }
}
