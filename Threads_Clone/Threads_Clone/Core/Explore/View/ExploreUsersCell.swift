//
//  ExpolreUsersCell.swift
//  Threads_Clone
//
//  Created by Ziyad Qassem on 15/12/2024.
//

import SwiftUI

struct ExploreUsersCell: View {
    var body: some View {
        
            HStack(spacing : 8 ) {
                CircularUserImage()
                VStack(alignment: .leading) {
                    Text("User Name")
                        .fontWeight(.semibold)
                    Text("User Full Name")
                       
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
    ExploreUsersCell()
}
