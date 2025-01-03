//
//  FeedView.swift
//  Threads_Clone
//
//  Created by Ziyad Qassem on 14/12/2024.
//

import SwiftUI

struct FeedView: View {
    @StateObject  var viewModel = FeedViewModel()
    
    
    var body: some View {
        NavigationStack{
            ScrollView(showsIndicators: false) {
                LazyVStack{
                    ForEach (viewModel.threads){ thread in
                        NavigationLink(value: thread) {
                            ThreadCell(thread: thread)
                        }
                    }
                }.refreshable {
                    Task{try await viewModel.fetchThreads()}
                }
                .navigationDestination(for: ThreadModel.self) { thread in
                    ThreadDetailsView(thread: thread)
        
                }
            }.navigationTitle("Threads")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar{
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            Task{try await viewModel.fetchThreads()}
                        } label: {
                            Image(systemName: "arrow.counterclockwise")
                                .foregroundStyle(.black)
                        }
                    }
                }
        }
        
    }
}

#Preview {
    FeedView()
}
