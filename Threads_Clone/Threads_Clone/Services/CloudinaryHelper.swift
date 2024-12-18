//
//  CloudinaryHelper.swift
//  Threads_Clone
//
//  Created by Ziyad Qassem on 18/12/2024.
//

import Foundation
import Cloudinary
class CloudinaryHelper {
    static let shared = CloudinaryHelper()
    
     let cloudinaryApiName  = CLDCloudinary(configuration: CLDConfiguration(cloudName: "dxum2njqu", secure: true))
    
    let cloudinaryUploadPreset : String = "dxum2njqu"
    
  //  "ml_default"
}
