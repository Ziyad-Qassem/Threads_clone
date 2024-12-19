//
//  TheadsServices.swift
//  Threads_Clone
//
//  Created by Ziyad Qassem on 19/12/2024.
//

import Foundation
import FirebaseFirestore

struct  ThreadService  {
     
    static func uploadThread(_ thread : ThreadModel) async throws {
        guard let threadData = try? Firestore.Encoder().encode(thread) else {
            print("############################")
            print("problem in encoding thread in uploadThread in threadService")
            print("############################")
            return
        }
        
       try await Firestore.firestore().collection("Threads").addDocument(data: threadData)
    }
    
    static func fetechAllThreads()async throws -> [ThreadModel] {
        
        let snapshot = try await Firestore.firestore().collection("Threads").order(by: "timestamp" , descending: true).getDocuments()
        return snapshot.documents.compactMap {  try? $0.data(as: ThreadModel.self)}
    
    }
    
    
    
}
