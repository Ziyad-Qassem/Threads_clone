//
//  ThreadDetailsView.swift
//  Threads_Clone
//
//  Created by Ziyad Qassem on 21/12/2024.
//

import SwiftUI

struct ThreadDetailsView: View {
    let thread : ThreadModel
    @StateObject var viewModel : ThreadDetailsViewModel
    init(thread : ThreadModel){
        self.thread = thread
        self._viewModel = StateObject(wrappedValue: ThreadDetailsViewModel(thread: thread))
    }
    var body: some View {
        ScrollView{
            VStack {
                HStack {
                    CircularUserImage(user: thread.user)
                    
                    Text(thread.user?.userName ?? "No user Name")
                        .font(.footnote)
                        .fontWeight(.semibold)
                    
                    Spacer()
                    
                    Text(thread.timestamp.timestampToString())
                        .font(.caption)
                        .foregroundStyle(Color(.systemGray3))
                    
                    Button {
                        
                    } label: {
                        Image(systemName: "ellipsis")
                            .foregroundStyle(Color(.darkGray))
                    }

                }
                
                VStack(alignment: .leading , spacing: 12){
                    Text(thread.caption)
                        .font(.subheadline)
                    
                    ContentActionButtonView(thread: thread)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Divider()
                    .padding(.vertical)
                
                LazyVStack {
                    ForEach(viewModel.threadReplies) { reply in
                        ThreadReplyCell(reply: reply)
                    }
                }
            }
        }
        .padding()
        .navigationTitle("Thread")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    ThreadDetailsView(thread: MockData.threadMockData)
}
