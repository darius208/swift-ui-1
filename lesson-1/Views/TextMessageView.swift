//
//  TextMessage.swift
//  lesson-1
//
//  Created by dev Darius on 14/07/2022.
//

import SwiftUI

struct TextMessageView: View {
    var textMessage: String
    var body: some View {
        HStack(alignment: .bottom) {
            Text(textMessage)
                       .padding(10)
                       .foregroundColor( Color.black)
                       .background( Color(UIColor(red: 240/255, green: 240/255, blue: 240/255, alpha: 1.0)))
                   .cornerRadius(10)
        }
    }
    
}

struct TextMessage_Previews: PreviewProvider {
    static var previews: some View {
        TextMessageView(textMessage: "Message")
    }
}
