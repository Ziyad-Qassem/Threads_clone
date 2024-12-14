//
//  TextFieldModifers.swift
//  Threads_Clone
//
//  Created by Ziyad Qassem on 14/12/2024.
//

import Foundation
import SwiftUICore
struct TextFieldModifiers : ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(12)
            .font(.subheadline)
            .background(Color(.systemGray6))
            .padding(.horizontal , 24)
            .cornerRadius(10)
    }
}
