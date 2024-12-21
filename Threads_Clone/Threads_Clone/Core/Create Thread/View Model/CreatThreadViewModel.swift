//
//  CreatThreadViewModel.swift
//  Threads_Clone
//
//  Created by Ziyad Qassem on 19/12/2024.
//

import Foundation
import FirebaseAuth
import FirebaseCore
class CreatThreadViewModel: ObservableObject {
    @Published var threadCaption : String = ""
    @Published var user : UserModel?
    
    init(){
        self.user = UserService.shared.currentUser
    }
    
    private func createThread() -> ThreadModel?{
      
        guard  let userId = Auth.auth().currentUser?.uid else{return nil }
        
        let thread = ThreadModel(threadOwerUid: userId, caption: threadCaption, timestamp: Timestamp(), likes: 0, replyCount: 0)
        
        return thread
    }
    
    func uploadThread() async throws {
        
        guard let thread = createThread() else {return}
        do{ try await ThreadService.uploadThread(thread)}
        catch {
            print("&&&&&&&&&&&&&&&&&&&&&&&&&")
            print("problem in uploading thread in creat thread view model")
            print("&&&&&&&&&&&&&&&&&&&&&&&&&")
        }
    }

}
