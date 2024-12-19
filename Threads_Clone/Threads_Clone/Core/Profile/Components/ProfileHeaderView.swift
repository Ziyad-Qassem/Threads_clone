//
//  ProfileHeaderView.swift
//  Threads_Clone
//
//  Created by Ziyad Qassem on 17/12/2024.
//

import SwiftUI

struct ProfileHeaderView: View {
    var user : UserModel?
    init(user: UserModel? ) {
        self.user = user
    }
    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading , spacing: 12) {
                VStack(alignment: .leading,spacing: 4) {
                    Text(user?.userName ?? "No value" )
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    Text(user?.fullName ?? "No Value")
                        .font(.subheadline)
                    
                }
                if let bio = user?.bio {
                    Text(bio)
                        .font(.footnote)
                }
                
                
                Text("100K Followers")
                    .font(.caption)
                    .foregroundStyle(.gray)
            }
            Spacer()
            CircularUserImage(user : user)
            
        }
    }
}

#Preview {
    ProfileHeaderView(user: UserModel(id: NSUUID().uuidString, fullName: "full user name", emial: "user_email@gmail.com", password: "",userName: "user name" ))
}
