//
//  FeedView.swift
//  Threads_Clone
//
//  Created by Ziyad Qassem on 14/12/2024.
//

import SwiftUI

struct FeedView: View {
    var body: some View {
        NavigationStack{
            ScrollView(showsIndicators: false) {
                LazyVStack{
                    ForEach (0 ... 10 , id:\.self){ thread in
                        ThreadCell()
                    }
                }.refreshable {
                    print("Not yet implemented")
                }
            }.navigationTitle("Threads")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar{
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            
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
