//
//  LoginVIew.swift
//  Threads_Clone
//
//  Created by Ziyad Qassem on 14/12/2024.
//

import SwiftUI

struct LoginVIew: View {
    @State private var email: String = ""
    @State private var password: String = ""
    var body: some View {
                NavigationStack {
                    VStack{
                        Spacer()
                        Image("Threads_Logo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 150, height: 150)
                            .padding()
                        VStack{
                            TextField("Enter your email", text: $email)
                                .modifier(TextFieldModifiers())
                                .autocapitalization(.none)
                                
                            SecureField("Enter your password" , text : $password)
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
                            
                        } label: {
                            Text("Login")
                                .modifier(ButtonModifiers())
                        }
                        
                        Spacer()
                        Divider()
                        NavigationLink {
                            Text("Sign Up")
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
    LoginVIew()
}
