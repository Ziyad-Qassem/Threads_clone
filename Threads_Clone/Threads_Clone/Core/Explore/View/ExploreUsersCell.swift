//
//  ExpolreUsersCell.swift
//  Threads_Clone
//
//  Created by Ziyad Qassem on 15/12/2024.
//

import SwiftUI

struct ExploreUsersCell: View {
    let user : UserModel?
    var body: some View {
        
            HStack {
                CircularUserImage(user: user)
                VStack(alignment: .leading) {
                    Text(user?.userName ?? "no value")
                        .fontWeight(.semibold)
                    Text(user?.fullName ?? "no value")
                       
                } .font(.footnote)
                Spacer()
                
               
                    Text("Follow")
                        .foregroundStyle(.black)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .frame(width: 100, height: 35)
                        .overlay{
                            RoundedRectangle(cornerRadius: 10)
                                .stroke( Color(.systemGray4  ), lineWidth: 1)
                        }
            }.padding(.horizontal)
           
       
    }
}

#Preview {
    ExploreUsersCell(user: UserModel(id: NSUUID().uuidString, fullName: "full user name", emial: "user_email@gmail.com", password: "",userName: "user name" ))
}
