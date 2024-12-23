//
//  ThreadDetailsViewModel.swift
//  Threads_Clone
//
//  Created by Ziyad Qassem on 21/12/2024.
//

import Foundation
@MainActor
class ThreadDetailsViewModel : ObservableObject {
    @Published var threadReplies = [ThreadReplyModel]()
 
    var currentUser : UserModel?
    
    init(thread : ThreadModel){
        self.currentUser = UserService().currentUser
        Task{
          let _ = try await fetchAllThreadReplies(forThread: thread)
        }
        
    }
    
    
   
   private  func fetchAllThreadReplies(forThread thread : ThreadModel) async throws {
       do {
           self.threadReplies = try await ReplyServices.fetchThreadReplies(forThread: thread)
       }
       catch {
           print("***************************\n")
           print("Error in fetchingAllThreadReplies in ThreadDetailsViewModel: \(error.localizedDescription)\n")
           print("***************************\n")
       }
       
       do {
           for i in 0 ..< threadReplies.count {
               let reply = threadReplies[i]
               let replyCreatorId = reply.replyOwnerId
               let replyCreator = try await UserService.fetchUserById(with: replyCreatorId)
               threadReplies[i].replyUser = replyCreator
           }
       }
       catch {
           print("***************************\n")
           print("Error in the second fetching in fetchingAllThreadReplies in ThreadDetailsViewModel: \(error.localizedDescription)\n")
           print("***************************\n")
       }
    }
    
}
