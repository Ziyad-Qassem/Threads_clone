//
//  ProfileThreadFilter.swift
//  Threads_Clone
//
//  Created by Ziyad Qassem on 15/12/2024.
//

import Foundation
enum ProfileThreadFilter : Int , CaseIterable , Identifiable {
    var id: Int {return self.rawValue}
    
    case threads 
    case replies
    
    var title : String {
        switch self {
        case .threads: return "Threads"
        case .replies: return "Replies"
        }
    }
}
