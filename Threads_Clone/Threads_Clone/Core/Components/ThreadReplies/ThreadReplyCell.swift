//
//  ThreadReplyCell.swift
//  Threads_Clone
//
//  Created by Ziyad Qassem on 21/12/2024.
//

import SwiftUI

struct ThreadReplyCell: View {
    let reply : ThreadReplyModel
    init(reply : ThreadReplyModel){
        self.reply = reply
    }
    var body: some View {
        VStack{
            HStack(alignment: .top, spacing: 12) {
                
                CircularUserImage(user: reply.replyUser)
                VStack(alignment: .leading, spacing: 4){
                    HStack {
                        Text(reply.replyUser?.userName ?? "user Name not found")
                            .font(.footnote)
                            .fontWeight(.semibold)
                        Spacer()
                        
                        Text(reply.timestamp.timestampToString())
                            .font(.caption)
                            .foregroundStyle(Color(.systemGray3))
                        Button {
                            
                        }label: {
                            Image(systemName: "ellipsis")
                                .foregroundStyle(Color(.darkGray))
                        }
                    }
                    Text(reply.replyText)
                        .font(.footnote)
                        .multilineTextAlignment(.leading)
                }
                Divider()
            }.padding()
        }
    }
}
    

#Preview {
    ThreadReplyCell(reply: MockData.threadReplyMocKData)
}
