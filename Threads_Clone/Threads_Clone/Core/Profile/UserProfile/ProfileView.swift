//
//  PrfileView.swift
//  Threads_Clone
//
//  Created by Ziyad Qassem on 14/12/2024.
//

import SwiftUI

struct ProfileView: View {
    let user : UserModel
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 20) {
                ProfileHeaderView(user: user)
                Button {
                    
                } label: {
                    Text("Follow")
                        .foregroundStyle(.white)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .frame(width: 350, height: 35)
                        .background(.black)
                        .cornerRadius(8)
                }
                UserContentListView(user : user)
            }.padding(.horizontal)
        }
        .navigationBarTitleDisplayMode(.inline)
        .padding(.horizontal)
    }
}



#Preview {
    ProfileView(user: UserModel(id: NSUUID().uuidString, fullName: "full user name", emial: "user_email@gmail.com", password: "",userName: "user name" ))
}
