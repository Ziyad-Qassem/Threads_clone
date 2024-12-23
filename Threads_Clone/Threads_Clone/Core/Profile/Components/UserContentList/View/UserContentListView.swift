//
//  UserContentListView.swift
//  Threads_Clone
//
//  Created by Ziyad Qassem on 17/12/2024.
//

import SwiftUI

struct UserContentListView: View {
    @State private var selectedFilter : ProfileThreadFilter = .threads
    @Namespace var animation
    private var filterBarWidth : CGFloat {
        let count = CGFloat(ProfileThreadFilter.allCases.count)
        return UIScreen.main.bounds.width / count - 16
    }
   
    init(user:  UserModel ) {
        self._viewModel = StateObject(wrappedValue: UserContentListViewModel(user: user))
    }
    
    @StateObject private var viewModel : UserContentListViewModel
    var body: some View {
        VStack{
            HStack{
                ForEach(ProfileThreadFilter.allCases){
                    filter in
                    VStack {
                        Text(filter.title)
                            .font(.subheadline)
                            .fontWeight(selectedFilter == filter ? .semibold : .regular)
                        if(selectedFilter == filter){
                            Rectangle()
                                .foregroundStyle(.black)
                                .frame(width : filterBarWidth , height : 1)
                                .matchedGeometryEffect(id:"item" , in: animation )
                                
                        }else {
                            Rectangle()
                                .foregroundStyle(.clear)
                                .frame(width : filterBarWidth , height : 1)
                        }
                                
                        }.onTapGesture {
                            withAnimation(.spring()){
                                selectedFilter = filter
                            }
                    }
                }
        }
            LazyVStack {
                if selectedFilter == .threads {
                    ForEach(viewModel.threads) { thread in
                    ThreadCell(thread: thread)
                            .transition(.move(edge: .leading))
                    }
                }else {
                    ForEach(viewModel.threadReplies) { reply in
                        ThreadReplyProfileCell(reply: reply)
                            .transition(.move(edge: .trailing))
                    }
                }
                
            }
        }.padding(.vertical , 8)
            
    }
}

#Preview {
    UserContentListView(user : UserModel(id: "", fullName: " user full name", emial: "user email", password: "user password", userName: "userName"))
}
