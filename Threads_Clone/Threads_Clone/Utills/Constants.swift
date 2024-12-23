//
//  Constants.swift
//  Threads_Clone
//
//  Created by Ziyad Qassem on 19/12/2024.
//

import Foundation
import Firebase
struct MockData {
    static let userMockData = UserModel(id: NSUUID().uuidString, fullName: "full user name", emial: "user_email@gmail.com", password: "",userName: "user name" )
    
    static let threadMockData = ThreadModel(threadOwerUid: "", caption: "this is a temp caption", timestamp: Timestamp(), likes: 100, replyCount: 80)
    
    static let threadReplyMocKData = ThreadReplyModel(threadId: "", replyOwnerId: " ", replyText: "this is just reply mock data" , threadOwnerId: "", timestamp: Timestamp())
    
}
struct FireStoreConstants {
    static let  Root = Firestore.firestore()
    static let UserCollection = Root.collection("users")
    static let ThreadCollection = Root.collection("Threads")
    static let RepliesCollection = Root.collection("Replies")
    static let FollowersCollection = Root.collection("Followers")
    static let FollowingCollection = Root.collection("Following")
    static let ActivityCollection = Root.collection("Activity")
}
