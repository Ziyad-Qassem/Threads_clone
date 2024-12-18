//
//  CurrentUserProfileView.swift
//  Threads_Clone
//
//  Created by Ziyad Qassem on 16/12/2024.
//

import SwiftUI

struct CurrentUserProfileView: View {
    @StateObject var viewModel = CurrentUserProfileViewModel()
    @State private var showEditProfileSheet = false
    var body: some View {
        NavigationStack{
            ScrollView(showsIndicators: false) {
                VStack(spacing: 20) {
                    ProfileHeaderView(user: viewModel.currentUser)
                    Button {
                        showEditProfileSheet.toggle()
                    } label: {
                        Text("Edit Profile")
                            .foregroundStyle(.black)
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .frame(width: 350, height: 35)
                            .background(.white)
                            .cornerRadius(8)
                            .overlay{
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke( Color(.systemGray4  ), lineWidth: 1)
                            }
                }
                UserContentListView()
            }.padding(.horizontal)
            
            }
            .sheet(isPresented: $showEditProfileSheet, content: {
                EditProfielView()
            })
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
    CurrentUserProfileView()
}
