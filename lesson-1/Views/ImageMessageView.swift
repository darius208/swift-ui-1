//
//  ImageMessageView.swift
//  lesson-1
//
//  Created by dev Darius on 14/07/2022.
//

import SwiftUI

extension String {
    var imageFrombase64: UIImage? {
        guard let imageData = Data(base64Encoded: self, options: .ignoreUnknownCharacters) else {
            return nil
        }
        return UIImage(data: imageData)
    }
}

struct ImageMessageView: View {
    var imageMessage: ImageMessage
    var body: some View {
        if imageMessage.direction == "Incoming" {
            HStack (alignment: .bottom) {
                Image("turtlerock")
                        .resizable()
                        .frame(width: 40, height: 40, alignment: .center)
                        .cornerRadius(20)
                ChatBubble(direction: .left) {
                    Image(uiImage: imageMessage.imageURL.imageFrombase64!)
                        .resizable()
                        .frame(width: UIScreen.main.bounds.width - 100,height: 200)
                        .aspectRatio(contentMode: .fill)
                }
            }.id(imageMessage.id)
        } else if imageMessage.direction == "Outbound" {
            ChatBubble(direction: .right) {
                Image(uiImage: imageMessage.imageURL.imageFrombase64!)
                    .resizable()
                    .frame(width: UIScreen.main.bounds.width - 70, height: 200)
                    .aspectRatio(contentMode: .fill)
            }.id(imageMessage.id)
        }
        
        
    }
}

struct ImageMessageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageMessageView(imageMessage: ImageMessage(id: 1, direction: "Outbound", timestamp: 1589485467, senderID: "Bob", destinationID: "Sally", imageURL: "turtlerock", thumbnailURL: "https://thumbnail.image.url", deliveryStatus: "Delivered", deliveryTimestamp:1589485467))
    }
}
