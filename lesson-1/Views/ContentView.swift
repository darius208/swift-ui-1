//
//  ContentView.swift
//  lesson-1
//
//  Created by dev Darius on 12/07/2022.
//

import SwiftUI
let chatMessagesArray = [
    TextMessage(direction: "Incoming", timestamp: 1589463871, senderID: "Bob", destinationID: "Sally", message: "I was sent this message", deliveryStatus: "Delivered", deliveryTimestamp: 1589463871),
    TextMessage(direction: "Outbound", timestamp: 1589467569, senderID: "Sally", destinationID: "Bob", message: "I sent this message", deliveryStatus: "Delivered", deliveryTimestamp: 1589467622),
    ImageMessage(direction: "Incoming", timestamp: 1589485467, senderID: "Bob", destinationID: "Sally", imageURL: "turtlerock", thumbnailURL: "https://thumbnail.image.url", deliveryStatus: "Delivered", deliveryTimestamp:1589485467),
] as [Any]
struct ContentView: View {
    var body: some View {
        VStack{
            ForEach(Array(chatMessagesArray.enumerated()), id: \.offset){_, message in
                if let txt = message as? TextMessage {
                    TextMessageView(textMessage: txt)
                }else if let img = message as? ImageMessage{
                    ImageMessageView(imageMessage: img)
                }
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
