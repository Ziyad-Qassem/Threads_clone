//
//  ExploreViewModel.swift
//  Threads_Clone
//
//  Created by Ziyad Qassem on 16/12/2024.
//

import Foundation


class ExploreViewModel : ObservableObject {
    @Published var users = [UserModel]()
    
    init() {
        Task{try await fetchUsers()}
    }
    @MainActor
    private func fetchUsers() async throws{
        self.users = try  await UserService.fetchUsersData()
    }
}
