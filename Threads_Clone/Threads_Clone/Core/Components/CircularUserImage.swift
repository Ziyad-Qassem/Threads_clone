//
//  CircularUserImage.swift
//  Threads_Clone
//
//  Created by Ziyad Qassem on 15/12/2024.
//

import SwiftUI

struct CircularUserImage: View {
    
    var body: some View {
        Image("profile-picture")
            .resizable()
            .clipShape(.circle)
            .scaledToFill()
            .frame(width: 50  , height: 50)
       
    }
}

#Preview {
    CircularUserImage()
}
