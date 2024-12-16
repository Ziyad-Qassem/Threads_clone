//
//  File.swift
//  Threads_Clone
//
//  Created by Ziyad Qassem on 16/12/2024.
//

import Foundation
import FirebaseAuth
import Combine
class ProfileViewModel : ObservableObject {

    @Published var currentUser : UserModel?
    private var cancellables = Set<AnyCancellable>()
    
    func signOutUsers()  {
        AuthManager.shared.signOut()
    }
    
    init(){
        setupSubscripers()
    }
    private func setupSubscripers(){
        UserService.shared.$currentUser.sink { [weak self] user in
            self?.currentUser = user
            
            print("user from  profile View Model from combine is \(user)")
        }.store(in: &cancellables)
    }
    
}
