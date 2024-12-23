//
//  LoginVIew.swift
//  Threads_Clone
//
//  Created by Ziyad Qassem on 14/12/2024.
//

import SwiftUI

struct LoginView: View {
    @StateObject private var viewModel = LoginViewModel()
  
    var body: some View {
                NavigationStack {
                    VStack{
                        Spacer()
                        Image("Threads_Logo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 150, height: 150)
                            .padding()
                            .padding(.bottom)
                    
                        VStack{
                            TextField("Enter your email", text: $viewModel.email)
                                .modifier(TextFieldModifiers())
                                .autocapitalization(.none)
                                
                            SecureField("Enter your password" , text : $viewModel.password)
                                .modifier(TextFieldModifiers())
                        }
                        
                        NavigationLink {
                            Text("Forgot password?")
                        } label: {
                            Text("Forgot password?")
                                .frame(maxWidth: .infinity, alignment: .trailing)
                                .font(.footnote)
                                .padding(.horizontal , 24)
                                .padding(.top)
                                .foregroundStyle(.black)
                                .fontWeight(.semibold)
                        }
                        
                        Button {
                            Task {try await viewModel.loginUser()}
                        } label: {
                            Text("Login")
                                .modifier(ButtonModifiers())
                        }
                        
                        Spacer()
                        Divider()
                        NavigationLink {
                            SignUpView()
                                .navigationBarBackButtonHidden()
                        } label: {
                            HStack(spacing: 3){
                                Text("Don't have an account?")
                                Text("Sign Up")
                                    .fontWeight(.semibold)
                            }.foregroundStyle(.black)
                                .font(.footnote)

                        }
                        .padding(.vertical , 16)
                        
            }
        }
    }
}

#Preview {
    LoginView()
}
