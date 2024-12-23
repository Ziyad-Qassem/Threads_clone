//
//  RegistrationViewModel.swift
//  Threads_Clone
//
//  Created by Ziyad Qassem on 15/12/2024.
//

import Foundation
class RegistrationViewModel : ObservableObject {
    @Published  var userName: String = ""
    @Published  var password: String = ""
    @Published  var fullName: String = ""
    @Published  var email: String = ""
    @MainActor
    func createuser() async throws{
        try await  AuthManager.shared.createUser(withEmail: email, password: password, fullName: fullName, userName: userName)
    }
}
