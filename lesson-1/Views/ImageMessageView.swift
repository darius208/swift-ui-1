//
//  ImageMessageView.swift
//  lesson-1
//
//  Created by dev Darius on 14/07/2022.
//

import SwiftUI

struct ImageMessageView: View {
    var imageMessage: ImageMessage
    var body: some View {
        if imageMessage.direction == "Incoming" {
            ChatBubble(direction: .left) {
                Image(imageMessage.imageURL)
                    .resizable()
                    .frame(width: UIScreen.main.bounds.width - 70,height: 200)
                    .aspectRatio(contentMode: .fill)
            }
        } else if imageMessage.direction == "Outbound" {
            ChatBubble(direction: .right) {
                Image(imageMessage.imageURL)
                    .resizable()
                    .frame(width: UIScreen.main.bounds.width - 70, height: 200)
                    .aspectRatio(contentMode: .fill)
            }
        }
        
        
    }
}

struct ImageMessageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageMessageView(imageMessage: ImageMessage(direction: "Incoming", timestamp: 1589485467, senderID: "Bob", destinationID: "Sally", imageURL: "turtlerock", thumbnailURL: "https://thumbnail.image.url", deliveryStatus: "Delivered", deliveryTimestamp:1589485467))
    }
}
