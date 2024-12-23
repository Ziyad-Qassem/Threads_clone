//
//  String Extension.swift
//  Threads_Clone
//
//  Created by Ziyad Qassem on 20/12/2024.
//

import Foundation
import UIKit
extension String {
    func heightWithConstrainedWidth(_ width: CGFloat , font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(
            with: constraintRect,
            options: .usesLineFragmentOrigin,
            attributes: [.font: font],
            context: nil
        )
        return boundingBox.height
    }
}
