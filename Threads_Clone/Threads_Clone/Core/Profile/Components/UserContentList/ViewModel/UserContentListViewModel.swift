//
//  UserContentListViewModel.swift
//  Threads_Clone
//
//  Created by Ziyad Qassem on 19/12/2024.
//

import Foundation
@MainActor
class UserContentListViewModel : ObservableObject {
    @Published var threads = [ThreadModel]()
    @Published var threadReplies = [ThreadReplyModel]()
    private let user : UserModel
    init(user: UserModel){
        self.user = user
        Task {try await fetchUserThreads()}
        Task {try await fetchUserReplies()}
    }
  
    private  func fetchUserThreads() async throws {
        
        var  threads = try await ThreadService.fetchUserThreadsByUid(uid: user.id)
        for i in 0 ..< threads.count {
            threads[i].user = self.user
        }
        self.threads = threads
    }
    
    private func fetchUserReplies() async throws {
        do {
            self.threadReplies = try await ReplyServices.fetchUserReplies(forUser: user)
            
           
            try await  pooulatungRepliesWithThreads()
        }
        catch {
            print("***************************\n")
            print("Error in fetching replies in UserContentListViewModel and it's: \(error.localizedDescription)\n")
            print("***************************\n")
        }
    }
    
    private func pooulatungRepliesWithThreads() async throws {
        do{
                for i in 0 ..< threadReplies.count {
                    let reply = threadReplies[i]
              
                    var thread = try await ThreadService.fetchThreadById(By: reply.threadId)
                    thread.user = try await UserService.fetchUserById(with: thread.threadOwerUid)
                   
                    threadReplies[i].thread = thread
                }
        }catch {
            print("***************************\n")
            print("Error in fetching thread or user for replies in pooulatungRepliesWithThreads in UserContentListViewModel and it's: \(error.localizedDescription)\n")
            print("***************************\n")
        }
    }
    
   
}
