//
//  FeedView.swift
//  Threads_Clone
//
//  Created by Ziyad Qassem on 14/12/2024.
//

import SwiftUI

struct FeedView: View {
    @StateObject  var viewModel = FeedViewModel()
    @State private var reload = 0
    
    var body: some View {
        NavigationStack{
            ScrollView(showsIndicators: false) {
                LazyVStack{
                    ForEach (viewModel.threads){ thread in
                        ThreadCell(thread: thread)
                    }
                }.refreshable {
                    print("Not yet implemented")
                }
            }.navigationTitle("Threads")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar{
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            reload += 1
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
