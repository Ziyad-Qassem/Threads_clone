//
//  File.swift
//  Threads_Clone
//
//  Created by Ziyad Qassem on 16/12/2024.
//

import Foundation
struct UserModel : Codable , Identifiable ,Hashable{
    let id : String
    let fullName : String
    let emial : String
    let password : String
    let userName : String
    var profileImage : String?
    var bio : String?
    
}
