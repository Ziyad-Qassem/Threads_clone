//
//  ReplyModel.swift
//  Threads_Clone
//
//  Created by Ziyad Qassem on 20/12/2024.
//

import Foundation
import FirebaseFirestore
struct ThreadReplyModel : Codable , Identifiable {
    @DocumentID var replyId : String?
    var id : String {
        return replyId ?? NSUUID().uuidString
    }
   
    let threadId : String
    let replyOwnerId : String
    let replyText : String
    let threadOwnerId : String
    let timestamp : Timestamp
   
    
    
    var thread : ThreadModel?
    var replyUser : UserModel?
    
}
