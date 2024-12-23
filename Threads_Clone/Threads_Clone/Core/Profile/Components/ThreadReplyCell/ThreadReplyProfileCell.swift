//
//  ThreadReplyProfileCell.swift
//  Threads_Clone
//
//  Created by Ziyad Qassem on 21/12/2024.
//

import SwiftUI

struct ThreadReplyProfileCell: View {
    let reply : ThreadReplyModel
    init(reply : ThreadReplyModel){
        self.reply = reply
    }
    var body: some View {
        VStack(alignment: .leading) {
            if let thread = reply.thread {
                // thread View
                HStack(alignment: .top){
                    VStack{
                        CircularUserImage(user: thread.user)
                        
                        Rectangle()
                            .frame(width: 2, height: 64)
                            .foregroundStyle(Color(.systemGray4))
                    }
                    
                    VStack(alignment: .leading, spacing : 12){
                
                        VStack(alignment: .leading, spacing: 4) {
                            Text(thread.user?.userName ?? "No user Name")
                                .fontWeight(.semibold)
                            
                            Text(thread.caption)
                        }.font(.footnote)
                        
                        ContentActionButtonView(thread: thread)
                    }
                    Spacer()
                    }
            }
            
            HStack(alignment: .top){
                CircularUserImage(user: reply.replyUser)
                
                VStack(alignment: .leading , spacing: 4 ) {
                    Text(reply.replyUser?.userName ?? "No user  Name")
                        .fontWeight(.semibold)
                    Text(reply.replyText)
                }.font(.footnote)
            }
            Divider()
                .padding(.bottom , 8)
        }.padding(.horizontal)
        
    }
}

#Preview {
    ThreadReplyProfileCell(reply: MockData.threadReplyMocKData)
}
