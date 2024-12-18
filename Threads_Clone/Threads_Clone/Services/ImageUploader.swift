//
//  ImageUploader.swift
//  Threads_Clone
//
//  Created by Ziyad Qassem on 17/12/2024.
//

import Foundation
import SwiftUI
import Cloudinary

struct ImageUploader {
  
    static func uploadUserProfileImage(_ image: UIImage) async throws -> String? {
        // Compress the image
        guard let imageData = image.jpegData(compressionQuality: 0.25) else {
            return nil
        }
        
        // Configure Cloudinary
        let cloudinary = CLDCloudinary(configuration: CLDConfiguration(cloudName: "dxum2njqu", secure: true))
        let cloudinaryUploadPreset: String = "ml_default"
        
        // Wrap the Cloudinary upload method in a continuation
        return try await withCheckedThrowingContinuation { continuation in
            cloudinary.createUploader().upload(data: imageData, uploadPreset: cloudinaryUploadPreset, completionHandler:  { response, error in
                if let error = error {
                    
                    continuation.resume(throwing: error) // Resume with the error
                    return
                }
                
                if let response = response, let url = response.url {
                    
                    continuation.resume(returning: url) // Resume with the URL
                } else {
                    
                    continuation.resume(returning: nil) // Resume with nil
                }
            })
        }
    }
}
