//
//  RessetPasswordView.swift
//  EventHub
//
//  Created by Yaroslav Orlov on 06.04.2023.
//

import SwiftUI

struct ResetPasswordView: View {
  @State private var email: String = ""
    var body: some View {
      ZStack {
        Colors.lightBlue.opacity(0.2)
          .ignoresSafeArea()
        VStack {
          VStack(alignment: .leading, spacing: 12) {
            Text("Resset Password")
              .font(.system(size: 24, weight: .medium))
            
            Text("Please enter your email address to \nrequest a password reset")
              .font(.system(size: 15,weight: .regular))
            
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
            .padding(.top, 27)
          }
          Button(action: {}) {
              Text("SEND")
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(.white)
          }
          .frame(width: 281, height: 58)
          .background(Colors.primaryBlue)
          .cornerRadius(15)
          .padding(.top, 40)
          
          Spacer()
        }
      }
    }
}

struct ResetPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ResetPasswordView()
    }
}
