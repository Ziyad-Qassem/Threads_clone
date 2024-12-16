//
//  DataBaseManager.swift
//  Threads_Clone
//
//  Created by Ziyad Qassem on 16/12/2024.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class UserService  {
    static let shared = UserService()
    @Published var currentUser : UserModel?
   
    init(){
        Task {
            try await fetchCurrentUser()
        }
    }
    
    @MainActor
    func fetchCurrentUser() async throws {
        guard let userId = Auth.auth().currentUser?.uid else {return}
        
        let snapShot = try await Firestore.firestore().collection("users").document(userId).getDocument()
        let user = try snapShot.data(as: UserModel.self)
        self.currentUser = user
        print("DEBUG: Fetched Current User\(user)")
    }
    func reset() {
        self.currentUser = nil
    }
    
    
    static func fetchUsersData() async throws  -> [UserModel]{
        guard let currenttUserId = Auth.auth().currentUser?.uid else {return []}
        
        let snapshot = try await Firestore.firestore().collection("users").getDocuments()
        let users = snapshot.documents.compactMap { try? $0.data(as: UserModel.self)}
        return users.filter({$0.id != currenttUserId})
    }
}
