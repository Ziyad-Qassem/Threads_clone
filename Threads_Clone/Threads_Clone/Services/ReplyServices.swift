//
//  ReplyServices.swift
//  Threads_Clone
//
//  Created by Ziyad Qassem on 20/12/2024.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth

struct ReplyServices {
    
    static func uploadReply(reply: ThreadReplyModel, thread : ThreadModel) async throws {
        guard let replyData = try? Firestore.Encoder().encode(reply) else {
            print("\n ***********************")
            print ("problem encoding reply in uploadReply in ReplyServices")
            print("\n ***********************")
            return
        }
        
         async let _ = try await FireStoreConstants.RepliesCollection.document().setData(replyData)
        
        async let _ = try await FireStoreConstants.ThreadCollection.document(thread.id).updateData(["replyCount":                    thread.replyCount + 1])
    }
    
    static func fetchThreadReplies(forThread thread: ThreadModel) async throws -> [ThreadReplyModel] {
        do {
            
            let snapshot = try await FireStoreConstants.RepliesCollection
                .whereField("threadId", isEqualTo: thread.id)
                .getDocuments()
            
            let replies = snapshot.documents.compactMap { document in
                do {
                    return try document.data(as: ThreadReplyModel.self)
                } catch {
                    print("Decoding error for document with ID in fetchThreadReplies in ReplyServices: \(document.documentID): \(error.localizedDescription)")
                    return nil
                }
            }
            
            return replies
        } catch  {
            print("***************************\n")
            print("Error fetchingThreadReplies in ReplyServices: \(error.localizedDescription)\n")
            print("***************************\n")
            return []
        }
    }

    
    static func fetchUserReplies(forUser  user : UserModel) async throws -> [ThreadReplyModel]{
       
        do {
            
            let snapshot = try await FireStoreConstants.RepliesCollection
                .whereField("replyOwnerId", isEqualTo: user.id)
                .getDocuments()
            
            let replies = snapshot.documents.compactMap { document in
                do {
                    return try document.data(as: ThreadReplyModel.self)
                } catch {
                    print("Decoding error for document with ID in fetchThreadReplies in ReplyServices: \(document.documentID): \(error.localizedDescription)")
                    return nil
                }
            }
            
            return replies
        } catch let fetchError as NSError {
            print("***************************\n")
            print("Error fetchingThreadReplies in ReplyServices: \(fetchError.localizedDescription)\n")
            print("***************************\n")
            return []
        }
    }
    
    
}
