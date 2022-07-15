//
//  ImageMessageView.swift
//  lesson-1
//
//  Created by dev Darius on 14/07/2022.
//

import SwiftUI

struct ImageMessageView: View {
    var imagePath: String
    var body: some View {
        VStack {
            Image(imagePath)
        }
        .padding(10)
        .foregroundColor(Color.black)
        .background(Color(UIColor(red: 240/255, green: 240/255, blue: 240/255, alpha: 1.0)))
        .cornerRadius(10)
        
    }
}

struct ImageMessageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageMessageView(imagePath: "turtlerock")
    }
}
