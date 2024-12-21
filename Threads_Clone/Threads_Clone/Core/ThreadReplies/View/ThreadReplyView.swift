//
//  ThreadReplyView.swift
//  Threads_Clone
//
//  Created by Ziyad Qassem on 20/12/2024.
//

import SwiftUI

struct ThreadReplyView: View {
    let thread : ThreadModel
    @State private var userReply : String = ""
    @State private var threadViewHeight : CGFloat = 24
    @StateObject var viewModel = ThreadReplyViewModel()
    @Environment(\.dismiss) var dismiss
    init(thread : ThreadModel){
        self.thread = thread
       
    }
    
    func setThreadViewHeight(){
        let profileImageDimension : CGFloat = 60
        let padding : CGFloat = 16
        let width = UIScreen.main.bounds.width - profileImageDimension - padding
        let font = UIFont.systemFont(ofSize: 12)
        
        let captioinSize = thread.caption.heightWithConstrainedWidth(width, font: font)
        threadViewHeight = profileImageDimension + captioinSize - padding
    }
    
    var body: some View {
        NavigationStack {
            VStack{
                Divider()
                
                VStack(alignment: .leading, spacing: 10){
                    HStack(alignment : .top){
                        VStack{
                            
                           
                            CircularUserImage(user: thread.user)
                            
                            Rectangle()
                                .frame(width: 2, height: threadViewHeight)
                                .foregroundStyle(Color(.systemGray4))
                        }
                        
                        VStack(alignment: .leading , spacing: 2){
                            Text(thread.user?.userName ?? "No User Name")
                                .fontWeight(.semibold)
                            
                            Text(thread.caption)
                                .multilineTextAlignment(.leading)
                        }.font(.footnote)
                        Spacer()
                    }
                    HStack(alignment: .top){
                        CircularUserImage(user: viewModel.currentUser)
                        VStack(alignment: .leading, spacing: 4) {
                            Text(viewModel.currentUser?.userName ?? "No User Name")
                                .fontWeight(.semibold )
                            TextField("Add your reply" , text: $userReply, axis:.vertical)
                        }.font(.footnote)
                        Spacer()
                        if !userReply.isEmpty{
                            Button {
                                userReply = ""
                            } label: {
                                Image(systemName: "xmark")
                                    .resizable()
                                    .frame(width: 12,height: 12)
                                    .foregroundStyle(.gray)
                            }

                        }
                    }.font(.footnote)
                    
                }.padding()
            
                Spacer()
            }
            .onAppear(){
                setThreadViewHeight()
            }
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
                            Task{try await viewModel.UploadThreadReply(replyContent: userReply, thread: thread)}
                            dismiss()
                        }
                    } label: {
                        Text("Post")
                            .font(.subheadline)
                            .foregroundStyle(.black)
                            .fontWeight(.semibold)
                            .opacity(userReply.isEmpty ? 0.5 : 1.0)
                            .disabled(userReply.isEmpty)
                    }
                }
                }
            .navigationTitle("Reply")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ThreadReplyView(thread: MockData.threadMockData)
}
