//
//  TimestampExtension.swift
//  Threads_Clone
//
//  Created by Ziyad Qassem on 19/12/2024.
//

import Foundation
import Firebase
extension Timestamp{
    func timestampToString() -> String{
        let  formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.second, .minute, .hour, .day, .weekOfMonth]
        formatter.maximumUnitCount = 1
        formatter.unitsStyle = .abbreviated
        return formatter.string(from: self.dateValue(), to: Date()) ?? ""
    }
    
}
