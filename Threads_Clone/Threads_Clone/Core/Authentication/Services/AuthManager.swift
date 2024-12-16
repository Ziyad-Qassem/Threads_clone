//
//  AuthManager.swift
//  Threads_Clone
//
//  Created by Ziyad Qassem on 15/12/2024.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore
class AuthManager {
    static let shared = AuthManager()
    @Published var userSession : FirebaseAuth.User?
    
    init (){
        self.userSession = Auth.auth().currentUser
    }
    
    @MainActor
    func login(withEmail  email : String , password : String) async throws {
        do{
            let result =   try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession =  result.user
            try await UserService.shared.fetchCurrentUser()
        }catch {
            print("DEBUG: this is an error in login user in auth manager \(error.localizedDescription)")
        }
    }
    
    
    @MainActor
    func createUser(withEmail email : String , password : String , fullName : String , userName : String) async throws{
        do{
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            try await uploadUserData(email: email, id: result.user.uid, password: password, userName: userName, fullName: fullName)
           
            print("this is the user \(result.user.uid)")
        } catch {
            print("DEBUG: this is an error in Create user in auth manager \(error.localizedDescription)")
            
        }
    }
    
    func signOut(){
        try? Auth.auth().signOut() 
        self.userSession = nil
        UserService.shared.reset()
    }
    
    @MainActor
 private func uploadUserData(email : String , id: String , password : String
                        , userName : String, fullName : String) async throws{
                     
                            let user = UserModel(id: id, fullName: fullName, emial: email, password: password, userName: userName)
                            guard let userData = try? Firestore.Encoder().encode(user) else { return }
                            try await Firestore.firestore().collection("users").document(id).setData(userData)
                            UserService.shared.currentUser = user
                        
                        }
}
