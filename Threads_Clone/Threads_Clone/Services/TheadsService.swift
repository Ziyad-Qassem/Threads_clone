//
//  TheadsServices.swift
//  Threads_Clone
//
//  Created by Ziyad Qassem on 19/12/2024.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth
struct  ThreadService  {
//MARK: this section is about threads uploadind and fetching
    static func uploadThread(_ thread : ThreadModel) async throws {
        guard let threadData = try? Firestore.Encoder().encode(thread) else {
            return
        }
        
       try await Firestore.firestore().collection("Threads").addDocument(data: threadData)
    }
    
    static func fetechAllThreads()async throws -> [ThreadModel] {
        
        let snapshot = try await Firestore.firestore().collection("Threads").order(by: "timestamp" , descending: true).getDocuments()
        return snapshot.documents.compactMap {  try? $0.data(as: ThreadModel.self)}
    
    }
    
    static func fetchUserThreadsByUid(uid : String) async throws -> [ThreadModel] {
        let snapshot = try await Firestore.firestore().collection("Threads").whereField("threadOwerUid", isEqualTo: uid).getDocuments()
        let threads =  snapshot.documents.compactMap {  try? $0.data(as: ThreadModel.self)}
        return threads.sorted(by: {$0.timestamp.dateValue() > $1.timestamp.dateValue()})
    }
    
    static func fetchThreadById(By threadId : String) async throws -> ThreadModel {
      
        let snapshot = try await FireStoreConstants.ThreadCollection.document(threadId).getDocument()
        
        let thread = try snapshot.data(as: ThreadModel.self)
        
            return thread
        
    }
    
}
//MARK: Likes section
extension ThreadService {
    static func likeThread(_ thread : ThreadModel) async throws {
        guard let uid = Auth.auth().currentUser?.uid else {return}
        let threadRef = FireStoreConstants.ThreadCollection.document(thread.id)
        async let _ = try await threadRef.collection("thread-likes").document(uid).setData([:])
        async let _ = try await threadRef.updateData(["likes": thread.likes + 1])
        async let _ = try await FireStoreConstants.UserCollection.document(uid).collection("user-likes").document(thread.id).setData([:])
    }
    
    static func unlikeThread(_ thread : ThreadModel) async throws {
        guard thread.likes > 0 else{return}
        
        guard let uid = Auth.auth().currentUser?.uid else {return}
        
        let threadRef = FireStoreConstants.ThreadCollection.document(thread.id)
        
        async let _ = threadRef.collection("thread-likes").document(uid).delete()
        
        async let _ = try await threadRef.updateData(["likes": thread.likes - 1])
        
        async let _ = try await FireStoreConstants.UserCollection.document(uid).collection("user-likes").document(thread.id).delete()
    }
    static func checkIfUserLikedThread(_ thread : ThreadModel) async throws -> Bool {
        guard let uid = Auth.auth().currentUser?.uid else {return false }
    
        let snapshot = try await FireStoreConstants.UserCollection.document(uid).collection("user-likes").document(thread.id).getDocument()
        return snapshot.exists
    }
}


