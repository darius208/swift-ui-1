//
//  Stack.swift
//  lesson-1
//
//  Created by dev Darius on 19/07/2022.
//

import SwiftUI

struct Stack<Content: View>: View {
    var axis: Axis.Set
    var content: Content
    
    init(_ axis: Axis.Set = .vertical, @ViewBuilder builder: ()->Content) {
        self.axis = axis
        self.content = builder()
    }
    
    var body: some View {
        switch axis {
            case .horizontal:
                HStack {
                        content
                    }
                case .vertical:
                    VStack {
                        content
                    }
                default:
                    VStack {
                        content
                    }
                }
    }
}

