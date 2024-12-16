//
//  ExploreView.swift
//  Threads_Clone
//
//  Created by Ziyad Qassem on 14/12/2024.
//

import SwiftUI

struct ExploreView: View {
    @State private var searchText: String = ""
    @StateObject private var ViewModel = ExploreViewModel()
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                LazyVStack{
                    ForEach (ViewModel.users) { user in
                        NavigationLink(value: user) {
                            VStack{
                                ExploreUsersCell(user: user)
                                Divider()
                            }.padding(.vertical , 4)
                        }
                        
                    }
                }
                navigationDestination(for: UserModel.self, destination: { user in
                    ProfileView()
                })
                .navigationTitle("Search")
                .searchable(text: $searchText, prompt: "Search")
            }

        }
    }
    
}

#Preview {
    ExploreView()
}
