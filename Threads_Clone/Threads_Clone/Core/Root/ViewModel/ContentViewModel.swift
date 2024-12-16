//
//  ContentViewModel.swift
//  Threads_Clone
//
//  Created by Ziyad Qassem on 16/12/2024.
//

import Foundation
import Combine
import FirebaseAuth

class ContentViewModel : ObservableObject {
    @Published var userSession :  FirebaseAuth.User?
    private var cancllables = Set<AnyCancellable>()
     init(){
         setupSubcribers()
    }
    
    private func setupSubcribers(){
        AuthManager.shared.$userSession.sink { [weak self] userSession in
            self?.userSession = userSession
        }.store(in: &cancllables)
    }
}
