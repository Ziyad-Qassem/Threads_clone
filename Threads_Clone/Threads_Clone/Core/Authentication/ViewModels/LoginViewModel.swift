//
//  LoginViewModel.swift
//  Threads_Clone
//
//  Created by Ziyad Qassem on 16/12/2024.
//

import Foundation

class LoginViewModel : ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    
    func loginUser() async throws {
        try await AuthManager.shared.login(withEmail: self.email, password: self.password)
        
    }
    
    
    
}
