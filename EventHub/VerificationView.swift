//
//  VerificationView.swift
//  EventHub
//
//  Created by Yaroslav Orlov on 06.04.2023.
//

import SwiftUI

struct VerificationView: View {
    var body: some View {
      ZStack {
        Colors.lightBlue.opacity(0.2)
          .ignoresSafeArea()
        VStack {
          VStack(alignment: .leading, spacing: 12) {
            Text("Verification")
              .font(.system(size: 24, weight: .medium))
            
            Text("We’ve send you the verification \ncode on +1 2620 0323 7631")
              .font(.system(size: 15,weight: .regular))
            
            HStack(spacing: 29) {
              ForEach(1..<5) { item in
                Rectangle()
                  .frame(width: 55, height: 55)
                  .foregroundColor(.clear)
                  .overlay(
                    RoundedRectangle(cornerRadius: 8)
                      .stroke(.gray, lineWidth: 2)
                  )
                  .overlay {
                    Text(item.description)
                  }
              }
            }
            .padding(.top, 27)
          }
          Button(action: {}) {
              Text("CONTINUE")
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(.white)
          }
          .frame(width: 281, height: 58)
          .background(Colors.primaryBlue)
          .cornerRadius(15)
          .padding(.top, 40)
          
          HStack {
            Text("Re-send code in")
              .font(.system(size: 15, weight: .regular))
            
            Text("0:20")
              .font(.system(size: 15, weight: .regular))
              .foregroundColor(.blue)
          }
          .padding(.top, 24)
          
          Spacer()
        }
      }
    }
}

struct VerificationView_Previews: PreviewProvider {
    static var previews: some View {
        VerificationView()
    }
}
