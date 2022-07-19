//
//  ReversedScrollView.swift
//  lesson-1
//
//  Created by dev Darius on 19/07/2022.
//

import SwiftUI

struct ReversedScrollView<Content: View>: View {
    var axis: Axis.Set
    var content: Content
    
    init(_ axis: Axis.Set,@ViewBuilder builder: ()->Content) {
        self.axis = axis
        self.content = builder()
    }
    
    var body: some View {
        GeometryReader { proxy in
            ScrollView(axis, showsIndicators: false)
            {
                Stack(axis) {
                    Spacer()
                    content
                }
                .frame(
                    minWidth: minWidth(in: proxy, for: axis),
                    minHeight: minHeight(in: proxy, for: axis)
                )
            }
        }
    }
    
    func minWidth(in proxy: GeometryProxy, for axis: Axis.Set) -> CGFloat? {
       axis.contains(.horizontal) ? proxy.size.width : nil
    }
        
    func minHeight(in proxy: GeometryProxy, for axis: Axis.Set) -> CGFloat? {
       axis.contains(.vertical) ? proxy.size.height : nil
    }

}

struct ReversedScrollView_Previews: PreviewProvider {
    static var previews: some View {
        ReversedScrollView(.vertical){
            ForEach(0..<20) { item in
                            Text("\(item)")
                                .padding()
                                .background(Color.gray.opacity(0.5))
                                .cornerRadius(6)
            }
            .frame(maxWidth: .infinity)
        }
    }
}
