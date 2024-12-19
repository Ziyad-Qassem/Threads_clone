//
//  ContentActionButtonView.swift
//  Threads_Clone
//
//  Created by Ziyad Qassem on 19/12/2024.
//

import SwiftUI

struct ContentActionButtonView: View {
    @StateObject var viewModel : ContentActionViewModel
    private var thread : ThreadModel {
        return viewModel.thread
    }
    init(thread : ThreadModel){
        
        self._viewModel = StateObject(wrappedValue: ContentActionViewModel(thread: thread))
    }
    private var threadLiked : Bool {
        return viewModel.thread.didLike ?? false
    }
    
    
    
    func handleLikeTapped(){
        Task {
            if threadLiked {
                try await viewModel.unlikeThread()
            }else{
             try await viewModel.likeThread()
            }
        }
    }
    
    var body: some View {
        VStack(alignment: .leading){
            HStack(spacing: 16) {
                Button {
                    handleLikeTapped()
                } label: {
                    Image(systemName: threadLiked ? "heart.fill" : "heart")
                        .foregroundStyle(threadLiked ? .red : .black)
                }
                Button {
                    
                } label: {
                    Image(systemName: "bubble.right")
                }
                
                Button {
                    
                } label: {
                    Image(systemName: "arrow.rectanglepath")
                }
                
                Button {
                    
                } label: {
                    Image(systemName: "paperplane")
                }
            }
            if thread.likes > 0 {
                Text("\(thread.likes) likes")
                    .font(.caption)
                    .foregroundStyle(.gray)
                    .padding(.vertical , 4)
            }
        }
    }
}

#Preview {
    ContentActionButtonView(thread: MockData.threadMockData)
}
