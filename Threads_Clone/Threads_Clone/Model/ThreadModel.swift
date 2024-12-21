//
//  ThreadModel.swift
//  Threads_Clone
//
//  Created by Ziyad Qassem on 19/12/2024.
//
import FirebaseFirestore
import Foundation
struct ThreadModel : Codable , Identifiable, Hashable {
    @DocumentID var threadId : String?
    var id : String {
        return threadId ?? NSUUID().uuidString
    }
    let threadOwerUid : String
    let caption : String
    let timestamp : Timestamp
    var likes : Int
    var replyCount : Int
    
    var didLike : Bool? = false
    var user : UserModel?
}

