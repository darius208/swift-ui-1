//
//  ContentView.swift
//  lesson-1
//
//  Created by dev Darius on 12/07/2022.
//

import SwiftUI
var chatMessagesArray = [
    TextMessage(id: 1, direction: "Incoming", timestamp: 1589463871, senderID: "Bob", destinationID: "Sally", message: "I was sent this message", deliveryStatus: "Delivered", deliveryTimestamp: 1589463871),
    TextMessage(id: 2, direction: "Outbound", timestamp: 1589467569, senderID: "Sally", destinationID: "Bob", message: "I sent this message", deliveryStatus: "Delivered", deliveryTimestamp: 1589467622),
    ImageMessage(id: 3, direction: "Incoming", timestamp: 1589485467, senderID: "Bob", destinationID: "Sally", imageURL: "turtlerock", thumbnailURL: "https://thumbnail.image.url", deliveryStatus: "Delivered", deliveryTimestamp:1589485467),
    ImageMessage(id: 4, direction: "Outbound", timestamp: 1589485467, senderID: "Bob", destinationID: "Sally", imageURL: "twinlake", thumbnailURL: "https://thumbnail.image.url", deliveryStatus: "Delivered", deliveryTimestamp:1589485467),
] as [Any]

struct ContentView: View {
    @State var typingMessage: String = ""
    @ObservedObject private var keyboard = KeyboardResponder()
    @State var listMessage: [Any] = chatMessagesArray
    @State private var targetMessage: TextMessage?
    @State private var image = UIImage()
    @State private var showSheet = false
    
    var body: some View {
        VStack(spacing: 0){
            ScrollViewReader {scrollView in
                ReversedScrollView(.vertical) {
                    ForEach(Array(listMessage.enumerated()), id: \.offset){_, message in
                            if let txt = message as? TextMessage {
                                TextMessageView(textMessage: txt)
                                    .transition(.move(edge: .bottom))
                            }else if let img = message as? ImageMessage{
                                ImageMessageView(imageMessage: img)
                                    .transition(.move(edge: .bottom))
                            }
                    }
                }.padding(.horizontal)
                .onChange(of: targetMessage) { message in
                    if let message = message {
                    targetMessage = nil
                    withAnimation(.default) {
                        scrollView.scrollTo(message.id)
                    }
                }
            }
        }
            if self.image.cgImage != nil  {
                Image(uiImage: self.image)
                    .resizable()
                    .frame(width: 50, height: 50)
            }
            HStack {
                Button(action: pressAttachment) {
                    Text("+").font(.largeTitle)
                }
                TextField("Message...", text: $typingMessage)
                          .textFieldStyle(RoundedBorderTextFieldStyle())
                          .frame(minHeight: CGFloat(30))
                          .simultaneousGesture(TapGesture().onEnded {
                              self.targetMessage = TextMessage(id: listMessage.count, direction: "Outbound", timestamp: 1589467569, senderID: "Sally", destinationID: "Bob", message: "I sent this message", deliveryStatus: "Delivered", deliveryTimestamp: 1589467622)
                            })
                Button(action: sendMessage) {
                    Text("Send")
                }
            }.frame(minHeight: CGFloat(50)).padding()
            
        }
        .padding(.bottom, keyboard.currentHeight)
        .edgesIgnoringSafeArea(keyboard.currentHeight == 0.0 ? .leading: .bottom)
        .sheet(isPresented: $showSheet) {
            ImagePicker(sourceType: .photoLibrary, selectedImage: $image)
        }
    }
    
    func sendMessage() {
        let direction = "Outbound"
        let today = Date()
        let timeInterval = today.timeIntervalSince1970
        let timeToInt = Int(timeInterval)
        var message = TextMessage(id: listMessage.count + 1, direction: direction, timestamp: timeToInt, senderID: "Bob", destinationID: "Sally", message: typingMessage, deliveryStatus: "Delivered", deliveryTimestamp: timeToInt)
        var imageMessage = ImageMessage(id: listMessage.count + 1, direction: direction, timestamp: timeToInt, senderID: "Bob", destinationID: "Sally", imageURL: "rainbowlake", thumbnailURL: "rainbowlake", deliveryStatus: "Delivered", deliveryTimestamp: timeToInt)
        if(self.image.cgImage != nil) {
            listMessage.append(imageMessage)
            if(self.typingMessage != "") {
                message.id = listMessage.count + 2
                listMessage.append(message)
            }
            self.targetMessage = message
        }else {
            listMessage.append(message)
            self.targetMessage = message
        }
        typingMessage=""
        image = UIImage()
        print(chatMessagesArray)
    }
    
    
    func pressAttachment() {
        showSheet = true
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
