//
//  SignUpView.swift
//  Threads_Clone
//
//  Created by Ziyad Qassem on 14/12/2024.
//

import SwiftUI

struct SignUpView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var fullName: String = ""
    @State private var email: String = ""
    @StateObject var viewModel = RegistrationViewModel()
    @Environment(\.dismiss) var  dismiss
    var body: some View {
        NavigationStack{
            VStack{
                Spacer()
                Image("Threads_Logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150 , height: 150)
                    .padding(.bottom)
        
                VStack{
                    TextField("Enter your email", text: $viewModel.email)
                        .modifier(TextFieldModifiers())
                        .autocapitalization(.none)
                        
                    SecureField("Enter your password" , text : $viewModel.password)
                        .modifier(TextFieldModifiers())
                    
                    TextField("Enter your full name" , text: $viewModel.fullName)
                        .modifier(TextFieldModifiers())
                    
                    TextField("Enter your username" , text: $viewModel.userName)
                        .modifier(TextFieldModifiers())
                        .autocapitalization(.none)
                    
                }

                Button {
                    Task{ try await  viewModel.createuser()
                        }
                } label: {
                    Text("Sign Up")
                        .modifier(ButtonModifiers())
                        .padding(.top)
                }
                Spacer()
                
                Divider()
                
                Button {
                    dismiss()
                }  label: {
                    HStack(spacing: 3){
                        Text("Already have an acount?")
                        Text("Sign in")
                            .fontWeight(.semibold)
                    }.foregroundStyle(.black)
                        .padding(.vertical , 15)
                }

            }
        }
    }
}

#Preview {
    SignUpView()
}
