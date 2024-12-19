//
//  FeedViewModel.swift
//  Threads_Clone
//
//  Created by Ziyad Qassem on 19/12/2024.
//

import Foundation
@MainActor
class FeedViewModel : ObservableObject {
    @Published var threads : [ThreadModel] = [ThreadModel]()
    
    init (){
        Task {try await fetchThreads()}
            
    }
    
    private func fetchThreads() async throws{
        self.threads = try await ThreadService.fetechAllThreads()
        try await fetchUserDataForThreads()
    }
    
    private func fetchUserDataForThreads() async throws{
        for i in 0 ..< threads.count {
            let thread = threads[i]
             let threadCreatorId = thread.threadOwerUid
            let threadCreator = try await UserService.fetchUserById(with: threadCreatorId)
            threads[i].user = threadCreator
        }
    }
    
}
