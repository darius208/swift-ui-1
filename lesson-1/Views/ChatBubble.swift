//
//  ChatBubble.swift
//  lesson-1
//
//  Created by dev Darius on 16/07/2022.
//

import SwiftUI

struct ChatBubble<Content>: View where Content: View {
    let direction: ChatBubbleShape.Direction
    let content: () -> Content
    var body: some View {
        HStack {
            if direction == .right {
                Spacer()
            }
            content().clipShape(ChatBubbleShape(direction: direction))
            if direction == .left {
                Spacer()
            }
        }.padding([(direction == .left) ? .leading : .trailing, .top, .bottom], 20)
            .padding((direction == .right) ? .leading : .trailing, 50)
    }
}

struct ChatBubble_Previews: PreviewProvider {
    static var previews: some View {
        ChatBubble(direction: .right) {
            TextMessageView(textMessage: TextMessage(direction: "Outbound", timestamp: 1589467569, senderID: "Sally", destinationID: "Bob", message: "I sent this message", deliveryStatus: "Delivered", deliveryTimestamp: 1589467622))
        }
    }
}
