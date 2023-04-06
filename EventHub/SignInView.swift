//
//  SignInView.swift
//  EventHub
//
//  Created by Yaroslav Orlov on 06.04.2023.
//

import SwiftUI

struct SignInView: View {
  @State private var email: String = ""
  @State private var password: String = ""
  @State private var isRemember: Bool = false
  
  var body: some View {
    VStack {
      logoContainer
      textFieldsContainer
      toggleContainer
      Spacer()
      Button(action: {}) {
          Text("Sign In")
            .font(.system(size: 16, weight: .medium))
            .foregroundColor(.white)
      }
      .frame(width: 281, height: 58)
      .background(Colors.primaryBlue)
      .cornerRadius(15)
    }
  }
}

extension SignInView {
  private var logoContainer: some View {
    VStack(spacing: 7) {
      Image("smallLogo")
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
            Image("mail")
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
            Image("lock")
              .padding(.leading, 15)
            Spacer()
            Image(systemName: "eye.slash")
              .padding(.trailing, 15)
          }
        }
    }
  }
  
  private var toggleContainer: some View {
    HStack {
      Spacer()
      Toggle("", isOn: $isRemember).labelsHidden()
      Text("Remember Me")
        .font(.system(size: 14, weight: .regular))
        .padding(.leading, 8)
      Spacer()
      Spacer()
      Spacer()
      Text("Forgot Password?")
        .font(.system(size: 14, weight: .regular))
        .padding(.trailing, 30)
    }
  }
}

struct SignInView_Previews: PreviewProvider {
  static var previews: some View {
    SignInView()
  }
}
