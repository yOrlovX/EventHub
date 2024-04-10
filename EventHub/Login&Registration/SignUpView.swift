//
//  SignUpView.swift
//  EventHub
//
//  Created by Yaroslav Orlov on 06.04.2023.
//

import SwiftUI

struct SignUpView: View {
    @Environment(\.router) var router
    
    @State private var fullName: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    
//    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack {
            Colors.lightBlue.opacity(0.2)
                .ignoresSafeArea()
            VStack(spacing: 30) {
                textFieldsContainer
                buttonsContainer
            }
        }
        .navigationTitle("Sign up")
        .navigationBarTitleDisplayMode(.large)
    }
}

extension SignUpView {
    
    private var textFieldsContainer: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Sign up")
                .font(.system(size: 24, weight: .medium))
            
            TextField("Full name", text: $fullName)
                .padding(.vertical, 20)
                .padding(.leading, 50)
                .frame(width: UIScreen.main.bounds.width - 60, height: 56)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(.gray, lineWidth: 2)
                )
                .overlay {
                    HStack {
                        SwiftUI.Image("profile")
                            .padding(.leading, 15)
                        Spacer()
                    }
                }
            
            TextField("abc@email.com", text: $email)
                .padding(.vertical, 20)
                .padding(.leading, 50)
                .frame(width: UIScreen.main.bounds.width - 60, height: 56)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(.gray, lineWidth: 2)
                )
                .overlay {
                    HStack {
                        SwiftUI.Image("mail")
                            .padding(.leading, 15)
                        Spacer()
                    }
                }
            
            TextField("Your password", text: $password)
                .padding(.vertical, 20)
                .padding(.leading, 50)
                .frame(width: UIScreen.main.bounds.width - 60, height: 56)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(.gray, lineWidth: 2)
                )
                .overlay {
                    HStack {
                        SwiftUI.Image("lock")
                            .padding(.leading, 15)
                        Spacer()
                        SwiftUI.Image(systemName: "eye.slash")
                            .padding(.trailing, 15)
                    }
                }
            
            TextField("Confirm password", text: $confirmPassword)
                .padding(.vertical, 20)
                .padding(.leading, 50)
                .frame(width: UIScreen.main.bounds.width - 60, height: 56)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(.gray, lineWidth: 2)
                )
                .overlay {
                    HStack {
                        SwiftUI.Image("lock")
                            .padding(.leading, 15)
                        Spacer()
                        SwiftUI.Image(systemName: "eye.slash")
                            .padding(.trailing, 15)
                    }
                }
        }
    }
    
    private var buttonsContainer: some View {
        VStack(spacing: 20) {
            Button(action: {}) {
                Text("Sign In")
                    .font(.system(size: 16, weight: .medium))
                    .foregroundColor(.white)
            }
            .frame(width: 281, height: 58)
            .background(Colors.primaryBlue)
            .cornerRadius(15)
            
            Text("OR")
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(.gray)
            
            Button(action: {}) {
                HStack {
                    SwiftUI.Image("google")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 26, height: 26)
                    Text("Login with Google")
                        .font(.system(size: 16, weight: .regular))
                        .foregroundColor(.black)
                }
            }
            .frame(width: 281, height: 58)
            .background(.white)
            .cornerRadius(15)
            
            Button(action: {}) {
                HStack {
                    SwiftUI.Image("fb")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 26, height: 26)
                    Text("Login with Facebook")
                        .font(.system(size: 16, weight: .regular))
                        .foregroundColor(.black)
                }
            }
            .frame(width: 281, height: 58)
            .background(.white)
            .cornerRadius(15)
            
            HStack(spacing: 10) {
                Text("Already have an account?")
                    .font(.system(size: 15, weight: .regular))
                
                Text("Sign in")
                    .font(.system(size: 15, weight: .regular))
                    .foregroundColor(.blue)
                    .onTapGesture {
//                        presentationMode.wrappedValue.dismiss()
                        router.dismissScreen()
                    }
            }
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
