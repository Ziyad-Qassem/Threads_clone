//
//  EditProfielView.swift
//  Threads_Clone
//
//  Created by Ziyad Qassem on 15/12/2024.
//

import SwiftUI
import PhotosUI
struct EditProfielView: View {
    @State private var userBio : String = ""
    @State private var userLink : String = ""
    @State private var isPrivate : Bool = false
    @Environment(\.dismiss) var dismiss
    @StateObject var viewModel = EditCurrentUserProfileViewModel()
    var body: some View {
        NavigationStack{
            ZStack {
                Color(.systemGroupedBackground)
                    .edgesIgnoringSafeArea([.bottom , .horizontal])
                VStack(spacing : 8){
                    
                    VStack(alignment : .leading ){
                        // first section  username , full name , user image
                        HStack {
                            VStack (alignment: .leading) {
                                Text("Name")
                                    .font(.headline)
                                    .fontWeight(.semibold)
                                Text("User name")
                                
                            }
                            Spacer()
                            
                            PhotosPicker(selection: $viewModel.selectedItem) {
                                if let image = viewModel.profileImage {
                                    image
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 40, height: 40)
                                        .clipShape(.circle)
                                        
                                }else {
                                    CircularUserImage()
                                }
                            }
                        }
                        Divider()
                        // section 2 bio label , actual user bio
                        VStack (alignment: .leading ){
                            Text("Bio")
                                
                                .fontWeight(.semibold)
                            TextField("Enter your bio ... ", text: $userBio , axis: .vertical)
                           
                        }
                        Divider()
                        // section profile link
                        VStack(alignment: .leading) {
                            Text("Link")
                                .font(.headline)
                                .fontWeight(.semibold)
                            TextField("Add link", text: $userLink, axis: .vertical)
                                .foregroundStyle(.gray)
                        }
                        Divider()
                        // section 4 Private profile option
                        Toggle("Profile Private", isOn: $isPrivate)
                    }.padding()
                    .font(.footnote)
                    .background(.white)
                    .padding()
                    .cornerRadius(10)
                    .overlay {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color(.systemGray4),lineWidth : 1)
                    }
                    
                }
                
                .navigationTitle("Edit Profile")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .topBarLeading){
                        Button {
                           dismiss()
                        } label: {
                            Text("Cancle")
                                .font(.subheadline)
                                .foregroundStyle(.black)
                                .fontWeight(.semibold)
                        }

                    }
                    
                    ToolbarItem(placement: .topBarTrailing) {
                        Button {
                            Task {try await viewModel.uploadUserData()}
                            dismiss()
                        } label: {
                            Text("Done")
                                .font(.subheadline)
                                .foregroundStyle(.black)
                                .fontWeight(.semibold)
                        }
                    }
                }
            }
           
            
           
        }
    }
}

#Preview {
    EditProfielView()
}
