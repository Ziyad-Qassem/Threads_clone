//
//  CreateThreadView.swift
//  Threads_Clone
//
//  Created by Ziyad Qassem on 14/12/2024.
//

import SwiftUI

struct CreateThreadView: View {
    @State private var newThread: String = ""
    @Environment(\.dismiss) var dismiss
    var body: some View {
        NavigationStack{
            VStack {
                HStack{
                    CircularUserImage()
                    VStack(alignment: .leading, spacing: 5) {
                        Text("User Name")
                            .fontWeight(.semibold )
                        TextField("Start a thread" , text: $newThread, axis:.vertical)
                    }.font(.footnote)
                    Spacer()
                    if !newThread.isEmpty{
                        Button {
                            newThread = ""
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
                        
                    } label: {
                        Text("Post")
                            .font(.subheadline)
                            .foregroundStyle(.black)
                            .fontWeight(.semibold)
                            .opacity(newThread.isEmpty ? 0.5 : 1.0)
                            .disabled(newThread.isEmpty)
                    }

                }
                }

        }
    }
}

#Preview {
    CreateThreadView()
}
