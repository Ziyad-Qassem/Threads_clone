//
//  ContentActionViewModels.swift
//  Threads_Clone
//
//  Created by Ziyad Qassem on 19/12/2024.
//

import Foundation

@MainActor
class ContentActionViewModel : ObservableObject {
    @Published var thread : ThreadModel
    
    init(thread : ThreadModel){
        self.thread = thread
        Task{try await checkIfUserLikedThread()}
    }
    
    func likeThread()async throws{
      
       try await ThreadService.likeThread(thread)
        self.thread.didLike = true
        self.thread.likes += 1
    }
    func unlikeThread() async throws {
        try await ThreadService.unlikeThread(thread)
        self.thread.didLike = false
        self.thread.likes -= 1
    }
    
    func checkIfUserLikedThread() async throws{
       let didLike = try await ThreadService.checkIfUserLikedThread(thread)
        
        if didLike {
            self.thread.didLike = true
        }
    }
    
}
