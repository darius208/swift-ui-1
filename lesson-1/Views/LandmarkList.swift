//
//  LandmarkList.swift
//  lesson-1
//
//  Created by dev Darius on 13/07/2022.
//

import SwiftUI

struct LandmarkList: View {
    var body: some View {
        NavigationView {
            List(landmarks, id: \.id) {landmark in
                NavigationLink {
                    LandmarkDetail(landmark: landmark)
                }label: {
                    LandmarkRow(landmark: landmark)
                }
            }
        }.navigationTitle("Landmarks")
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList()
    }
}