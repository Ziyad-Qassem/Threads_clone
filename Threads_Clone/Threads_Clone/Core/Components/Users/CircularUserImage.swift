//
//  CircularUserImage.swift
//  Threads_Clone
//
//  Created by Ziyad Qassem on 15/12/2024.
//

import SwiftUI
import Kingfisher
struct CircularUserImage: View {
    var user : UserModel?
    init (user : UserModel?){
        self.user = user
    }
    var body: some View {
        if let imageUrl = user?.profileImage {
            KFImage(URL(string: imageUrl))
                .resizable()
                .clipShape(.circle)
                .scaledToFill()
                .frame(width: 60, height: 60)
           
        }
        else {
            Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width: 60  , height: 60)
                .foregroundStyle(Color(.systemGray))
        }
    }
}

#Preview {
    CircularUserImage(user:  UserModel(id: NSUUID().uuidString, fullName: "full user name", emial: "user_email@gmail.com", password: "",userName: "user name" ))
}
