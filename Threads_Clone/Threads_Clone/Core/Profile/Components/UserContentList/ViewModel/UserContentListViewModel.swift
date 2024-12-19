//
//  UserContentListViewModel.swift
//  Threads_Clone
//
//  Created by Ziyad Qassem on 19/12/2024.
//

import Foundation
class UserContentListViewModel : ObservableObject {
    @Published var threads = [ThreadModel]()
    private let user : UserModel
    init(user: UserModel){
        self.user = user
        Task {try await fetchUserThreads()}
    }
    @MainActor
    func fetchUserThreads() async throws {
        
        var  threads = try await ThreadService.fetchUserThreadsByUid(uid: user.id)
        for i in 0 ..< threads.count {
            threads[i].user = self.user
        }
        self.threads = threads
    }
    
    
}
