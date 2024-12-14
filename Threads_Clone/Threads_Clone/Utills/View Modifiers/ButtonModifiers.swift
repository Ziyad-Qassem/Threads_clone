//
//  ButtonModifiers.swift
//  Threads_Clone
//
//  Created by Ziyad Qassem on 14/12/2024.
//

import SwiftUI
struct ButtonModifiers: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.subheadline)
            .frame(width: 350, height: 45, alignment: .center)
            .background(.black)
            .foregroundStyle(.white)
            .cornerRadius(10)
    }
}
