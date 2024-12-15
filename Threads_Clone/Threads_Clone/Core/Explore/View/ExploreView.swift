//
//  ExploreView.swift
//  Threads_Clone
//
//  Created by Ziyad Qassem on 14/12/2024.
//

import SwiftUI

struct ExploreView: View {
    @State private var searchText: String = ""
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                LazyVStack{
                    ForEach (0 ... 10 , id:\.self) { user in
                        ExploreUsersCell()
                        
                    }.padding()
                }.padding(.vertical , 4)
                .navigationTitle("Search")
                .searchable(text: $searchText, prompt: "Search")
            }

        }
    }
    
}

#Preview {
    ExploreView()
}
