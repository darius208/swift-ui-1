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
            HStack (alignment: .bottom){
                Image("turtlerock")
                        .resizable()
                        .frame(width: 40, height: 40, alignment: .center)
                        .cornerRadius(20)
                ChatBubble(direction: .left) {
                    Text(textMessage.message)
                        .padding(.all, 20)
                        .foregroundColor(Color.black)
                        .background( Color(UIColor(red: 240/255, green: 240/255, blue: 240/255, alpha: 1.0)))
                }
            }.id(textMessage.id)
        } else if textMessage.direction == "Outbound" {
            HStack {
                ChatBubble(direction: .right) {
                    Text(textMessage.message)
                        .padding(.all, 20)
                        .foregroundColor(Color.white)
                        .background(Color.blue)
                }
            }.id(textMessage.id)
        }
    }
    
}

struct TextMessage_Previews: PreviewProvider {
    static var previews: some View {
        TextMessageView(textMessage: TextMessage(id: 1, direction: "Outbound", timestamp: 1589463871, senderID: "Bob", destinationID: "Sally", message: "I was sent this message", deliveryStatus: "Delivered", deliveryTimestamp: 1589463871))
    }
}
