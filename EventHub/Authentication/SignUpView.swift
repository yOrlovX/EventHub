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
    
    @State private var isSecured: Bool = true
    
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
                .modifier(TextFieldModifier())
                .overlay {
                    HStack {
                        SwiftUI.Image("profile")
                            .padding(.leading, 15)
                        Spacer()
                    }
                }
            
            TextField("abc@email.com", text: $userViewModel.email)
                .keyboardType(.emailAddress)
                .modifier(TextFieldModifier())
                .overlay {
                    HStack {
                        SwiftUI.Image("mail")
                            .padding(.leading, 15)
                        Spacer()
                    }
                }
            
            if isSecured {
                SecureField("Your password", text: $userViewModel.password)
                    .modifier(TextFieldModifier())
                    .overlay {
                        HStack {
                            SwiftUI.Image("lock")
                                .padding(.leading, 15)
                            Spacer()
                            SwiftUI.Image(systemName: "eye.slash")
                                .padding(.trailing, 15)
                                .onTapGesture {
                                    isSecured.toggle()
                                }
                        }
                    }
            } else {
                TextField("Your password", text: $userViewModel.password)
                    .modifier(TextFieldModifier())
                    .overlay {
                        HStack {
                            SwiftUI.Image("lock")
                                .padding(.leading, 15)
                            Spacer()
                            SwiftUI.Image(systemName: "eye")
                                .padding(.trailing, 15)
                                .onTapGesture {
                                    isSecured.toggle()
                                }
                        }
                    }
            }
            
            if isSecured {
                SecureField("Confirm password", text: $userViewModel.userRepeatedPassword)
                    .modifier(TextFieldModifier())
                    .overlay {
                        HStack {
                            SwiftUI.Image("lock")
                                .padding(.leading, 15)
                            Spacer()
                            SwiftUI.Image(systemName: "eye.slash")
                                .padding(.trailing, 15)
                                .onTapGesture {
                                    isSecured.toggle()
                                }
                        }
                    }
            } else {
                TextField("Confirm password", text: $userViewModel.userRepeatedPassword)
                    .modifier(TextFieldModifier())
                    .overlay {
                        HStack {
                            SwiftUI.Image("lock")
                                .padding(.leading, 15)
                            Spacer()
                            SwiftUI.Image(systemName: "eye")
                                .padding(.trailing, 15)
                                .onTapGesture {
                                    isSecured.toggle()
                                }
                        }
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
