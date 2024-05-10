//
//  SignUpView.swift
//  EventHub
//
//  Created by Yaroslav Orlov on 06.04.2023.
//

import SwiftUI

struct SignUpView: View {
    @Environment(\.router) var router
    
    @EnvironmentObject var userViewModel: UserViewModel
    
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
            TextField("Full name", text: $userViewModel.userName)
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
            
            TextField("abc@email.com", text: $userViewModel.email)
                .padding(.vertical, 20)
                .padding(.leading, 50)
                .frame(width: UIScreen.main.bounds.width - 60, height: 56)
                .keyboardType(.emailAddress)
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
            //securefield rework
            TextField("Your password", text: $userViewModel.password)
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
            //securefield rework
            TextField("Confirm password", text: $userViewModel.userRepeatedPassword)
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
            Button(action: { userViewModel.sighUp()
                userViewModel.isUserSignIn = true
                router.dismissScreen()
            }) {
                Text("Sign Up")
                    .modifier(PrimaryButtonModifier())
            }
            .opacity(userViewModel.isSingUpCredentialsValid ? 1 : 0.5)
            .disabled(!userViewModel.isSingUpCredentialsValid)
            
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
                        router.dismissScreen()
                    }
            }
        }
    }
}
