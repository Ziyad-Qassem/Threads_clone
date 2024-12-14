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
    var body: some View {
        NavigationStack{
            VStack{
                Spacer()
                Image("Threads_Logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150 , height: 150)
                VStack{
                    TextField("Enter your email", text: $email)
                        .modifier(TextFieldModifiers())
                        .autocapitalization(.none)
                        
                    SecureField("Enter your password" , text : $password)
                        .modifier(TextFieldModifiers())
                    
                    TextField("Enter your full name" , text: $fullName)
                        .modifier(TextFieldModifiers())
                    
                    TextField("Enter your username" , text: $username)
                        .modifier(TextFieldModifiers())
                    
                }

                Button {
                    
                } label: {
                    Text("Sign Up")
                        .modifier(ButtonModifiers())
                        .padding(.top)
                }
                Spacer()
                
                Divider()
                
                Button {
                    
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
