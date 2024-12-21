//
//  ThreadReplyViewModel.swift
//  Threads_Clone
//
//  Created by Ziyad Qassem on 20/12/2024.
//

import Foundation
import Firebase
@MainActor
class ThreadReplyViewModel : ObservableObject {
    let currentUser : UserModel?
    
   
    init() {
        self.currentUser = UserService.shared.currentUser
    }
    
    func UploadThreadReply(replyContent: String, thread: ThreadModel )  async throws{
        guard let id = currentUser?.id else {return}
        let reply = ThreadReplyModel(threadId: thread.id, replyOwnerId: id, replyText: replyContent, threadOwnerId: thread.threadOwerUid, timestamp: Timestamp())
        
        try await ReplyServices.uploadReply(reply: reply, thread: thread)
    
    }
    
    
}
