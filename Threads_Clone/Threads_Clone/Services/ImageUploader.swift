//
//  ImageUploader.swift
//  Threads_Clone
//
//  Created by Ziyad Qassem on 17/12/2024.
//

import Foundation
import FirebaseAuth
import Firebase
import FirebaseStorage


struct ImageUploader {
    static func uploadUserProfileImage(_ image : UIImage)  async throws -> String?{
        guard let imageData = image.jpegData(compressionQuality: 0.25) else {return "[DEBUG]: failed in compression in uploadUserProfileImage in ImageUploader"}
        let fileName = NSUUID().uuidString
        let storageRef = Storage.storage().reference(withPath: "/\(fileName).jpg")
        
        do {
            let _ = try await storageRef.putDataAsync(imageData)
            let url = try await storageRef.downloadURL()
            return url.absoluteString
        }catch {
            print("[DEBUG]:  failed to upload profile image in uploadUserProfileImage function in ImageUploader \(error.localizedDescription)")
            return nil
        }
        
    }
    
    

    
    
}
