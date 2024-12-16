//
//  PrfileView.swift
//  Threads_Clone
//
//  Created by Ziyad Qassem on 14/12/2024.
//

import SwiftUI

struct ProfileView: View {
    @StateObject private var viewModel = ProfileViewModel()
    @State private var selectedFilter : ProfileThreadFilter = .threads
    @Namespace var animation
    private var filterBarWidth : CGFloat {
        let count = CGFloat(ProfileThreadFilter.allCases.count)
        return UIScreen.main.bounds.width / count - 16
    }
    var body: some View {
        NavigationStack{
            ScrollView(showsIndicators: false) {
                VStack(spacing: 20) {
                    HStack(alignment: .top) {
                        VStack(alignment: .leading , spacing: 12) {
                            VStack(alignment: .leading,spacing: 4) {
                                Text(viewModel.currentUser?.userName ?? "Nothing exists")
                                    .font(.title2)
                                    .fontWeight(.semibold)
                                
                                Text(viewModel.currentUser?.fullName ?? "nothing exists")
                                    .font(.subheadline)
                                
                            }
                            if let bio = viewModel.currentUser?.bio {
                                Text(bio)
                                    .font(.footnote)
                            }
                          
                            
                            Text("100K Followers")
                                .font(.caption)
                                .foregroundStyle(.gray)
                        }
                        Spacer()
                        CircularUserImage()
                        
                    }
                    Button {
                        
                    } label: {
                        Text("Follow")
                            .foregroundStyle(.white)
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .frame(width: 350, height: 35)
                            .background(.black)
                            .cornerRadius(8)
                }
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
                        ForEach(0 ... 10 , id:\.self) { thread in
                            ThreadCell()
                            
                        }
                    }
                }.padding(.vertical , 8)
            }.padding(.horizontal)
            
            }
            .toolbar{
                ToolbarItem(placement : .topBarTrailing ) {
                    Button {
                        viewModel.signOutUsers()
                    } label: {
                        Image(systemName: "line.3.horizontal")
                    }

                }
            }
        }
    }
}
    
    

#Preview {
    ProfileView()
}
