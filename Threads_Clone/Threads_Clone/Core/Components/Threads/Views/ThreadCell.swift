//
//  ThreadCell.swift
//  Threads_Clone
//
//  Created by Ziyad Qassem on 14/12/2024.
//

import SwiftUI
import FirebaseCore

struct ThreadCell: View {
    let thread : ThreadModel
    var body: some View {
        VStack{
            HStack(alignment: .top, spacing: 12) {
                
                CircularUserImage(user: thread.user)
                VStack(alignment: .leading, spacing: 4){
                    HStack {
                        Text(thread.user?.userName ?? "user Name not found")
                            .font(.footnote)
                            .fontWeight(.semibold)
                        Spacer()
                        
                        Text(thread.timestamp.timestampToString())
                            .font(.caption)
                            .foregroundStyle(Color(.systemGray3))
                        Button {
                            
                        }label: {
                            Image(systemName: "ellipsis")
                                .foregroundStyle(Color(.darkGray))
                        }
                    }
                    Text(thread.caption)
                        .font(.footnote)
                        .multilineTextAlignment(.leading)
                    ContentActionButtonView(thread: thread)
                        .padding(.vertical , 8)
                        .foregroundStyle(.black)
                    }
                }
            Divider()
        }.padding()
        }
    }

#Preview {
    ThreadCell(thread: MockData.threadMockData)
}
