//
//  SignInView.swift
//  EventHub
//
//  Created by Yaroslav Orlov on 06.04.2023.
//

import SwiftUI

struct SignInView: View {
    @Environment(\.router) var router
    
    @EnvironmentObject var userViewModel: UserViewModel
    
    @State private var isRemember: Bool = false
    @State private var isSecured: Bool = true
    
    var body: some View {
        ZStack {
            Colors.lightBlue.opacity(0.2)
                .ignoresSafeArea()
            VStack(spacing: DisplayAdaptiveSpacing.adaptiveSpacing()) {
                logoContainer
                textFieldsContainer
                toggleContainer
                buttonsContainer
            }
        }
        .navigationBarHidden(true)
    }
}

extension SignInView {
    private var logoContainer: some View {
        VStack(spacing: 7) {
            SwiftUI.Image("smallLogo")
                .resizable()
                .scaledToFit()
                .frame(width: 58, height: 58)
            
            Text("EventHub")
                .font(.system(size: 35, weight: .medium))
        }
    }
    
    private var textFieldsContainer: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Sign in")
                .font(.system(size: 24, weight: .medium))
            
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
        }
    }
    
    private var toggleContainer: some View {
        HStack {
            Spacer()
            Toggle("", isOn: $isRemember).labelsHidden()
                .tint(Colors.primaryBlue)
            Text("Remember Me")
                .font(.system(size: 14, weight: .regular))
                .padding(.leading, 8)
            Spacer()
            Spacer()
            Spacer()
            Text("Forgot Password?")
                .font(.system(size: 14, weight: .regular))
                .padding(.trailing, 30)
                .onTapGesture {
                    router.showScreen(.push) { _ in
                        ResetPasswordView()
                    }
                }
        }
    }
    
    private var buttonsContainer: some View {
        VStack(spacing: 15) {
            Button(action: { userViewModel.sighIn()
                userViewModel.isUserSignIn = true
            }) {
                Text("Sign In")
                    .modifier(PrimaryButtonModifier())
            }
            .opacity(userViewModel.isSingInCredentialsValid ? 1 : 0.5)
            .disabled(!userViewModel.isSingInCredentialsValid)
            
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
                Text("Don’t have an account?")
                    .font(.system(size: 15, weight: .regular))
                
                Button(action: { router.showScreen(.push) { _ in SignUpView()}}) {
                    Text("Sign up")
                        .font(.system(size: 15, weight: .regular))
                        .foregroundColor(.blue)
                }
            }
        }
    }
}

struct SignInView_Previews: PreviewProvider {
    static let userViewModel = UserViewModel()
    static var previews: some View {
        Group {
            SignUpView()
                .environmentObject(userViewModel)
                .previewDevice(PreviewDevice(rawValue: "iPhone 11"))
            
            SignUpView()
                .environmentObject(userViewModel)
                .previewDevice(PreviewDevice(rawValue: "iPhone 8"))
        }
    }
}
