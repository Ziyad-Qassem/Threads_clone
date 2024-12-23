//
//  CreateThreadView.swift
//  Threads_Clone
//
//  Created by Ziyad Qassem on 14/12/2024.
//

import SwiftUI

struct CreateThreadView: View {
    @StateObject private var viewModel = CreatThreadViewModel()
    @Environment(\.dismiss) var dismiss
    
    
    var body: some View {
        NavigationStack{
            VStack {
                HStack{
                    CircularUserImage(user: viewModel.user)
                    VStack(alignment: .leading, spacing: 5) {
                        Text(viewModel.user?.userName ?? "No User Name")
                            .fontWeight(.semibold )
                        TextField("Start a thread" , text: $viewModel.threadCaption, axis:.vertical)
                    }.font(.footnote)
                    Spacer()
                    if !viewModel.threadCaption.isEmpty{
                        Button {
                            viewModel.threadCaption = ""
                        } label: {
                            Image(systemName: "xmark")
                                .resizable()
                                .frame(width: 12,height: 12)
                                .foregroundStyle(.gray)
                        }

                    }
                }
                Spacer()
            }.padding()
            .navigationTitle("New Thread")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading){
                    Button {
                        dismiss()
                    } label: {
                        Text("Cancle")
                            .font(.subheadline)
                            .foregroundStyle(.black)
                            .fontWeight(.semibold)
                    }

                }
                ToolbarItem (placement: .topBarTrailing){
                    Button {
                        Task {
                            try await viewModel.uploadThread()
                            dismiss()
                        }
                        
                    } label: {
                        Text("Post")
                            .font(.subheadline)
                            .foregroundStyle(.black)
                            .fontWeight(.semibold)
                            .opacity(viewModel.threadCaption.isEmpty ? 0.5 : 1.0)
                            .disabled(viewModel.threadCaption.isEmpty)
                    }

                }
                }

        }
    }
}

#Preview {
    CreateThreadView()
}
