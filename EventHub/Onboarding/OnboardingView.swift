//
//  OnboardingView.swift
//  EventHub
//
//  Created by Yaroslav Orlov on 06.04.2023.
//

import SwiftUI

struct OnboardingView: View {
  @State private var onboardingState: Int = 1
  
    var body: some View {
      ZStack {
        switch onboardingState {
        case 1:
          firstOnboardingState
        case 2:
          secondOnboardingState
        case 3:
          thirdOnboardingState
        case 4:
          SignInView()
        default:
          firstOnboardingState
        }
      }
    }
}

extension OnboardingView {
  
  private var firstOnboardingState: some View {
    VStack {
      Image("onboarding1")
        .resizable()
        .scaledToFit()
      Spacer()
      Rectangle()
        .foregroundColor(Colors.primaryBlue)
        .frame(height: 375)
        .cornerRadius(40)
        .overlay {
          VStack {
            Spacer()
            Text("Explore Upcoming and \nNearby Events")
              .multilineTextAlignment(.center)
              .font(.system(size: 22, weight: .medium))
              .foregroundColor(.white)
              .padding(.top, 30)
            
            Text("In publishing and graphic design, Lorem is \na placeholder text commonly ")
              .font(.system(size: 15, weight: .regular))
              .multilineTextAlignment(.center)
              .foregroundColor(.white)
              .padding(.top, 16)
            
            HStack {
              Spacer()
              Text("Skip")
                .font(.system(size: 18, weight: .medium))
                .foregroundColor(.white)
              Spacer()
              Spacer()
              SegmentProgressView(segmentValue: $onboardingState)
              Spacer()
              Spacer()
              Text("Next")
                .font(.system(size: 18, weight: .medium))
                .foregroundColor(.white)
                .onTapGesture {
                  self.onboardingState += 1
                }
              Spacer()
            }
            .padding(.top, 40)
            Spacer()
          }
        }
    }
    .ignoresSafeArea()
  }
  
  private var secondOnboardingState: some View {
    VStack {
      Image("onboarding2")
        .resizable()
        .scaledToFit()
      Spacer()
      Rectangle()
        .foregroundColor(Colors.primaryBlue)
        .frame(height: 375)
        .cornerRadius(40)
        .overlay {
          VStack {
            Spacer()
            Text("Web Have Modern Events Calendar Feature")
              .multilineTextAlignment(.center)
              .font(.system(size: 22, weight: .medium))
              .foregroundColor(.white)
              .padding(.top, 30)
            
            Text("In publishing and graphic design, Lorem is \na placeholder text commonly ")
              .font(.system(size: 15, weight: .regular))
              .multilineTextAlignment(.center)
              .foregroundColor(.white)
              .padding(.top, 16)
            
            HStack {
              Spacer()
              Text("Skip")
                .font(.system(size: 18, weight: .medium))
                .foregroundColor(.white)
              Spacer()
              Spacer()
              SegmentProgressView(segmentValue: $onboardingState)
              Spacer()
              Spacer()
              Text("Next")
                .font(.system(size: 18, weight: .medium))
                .foregroundColor(.white)
                .onTapGesture {
                  self.onboardingState += 1
                }
              Spacer()
            }
            .padding(.top, 40)
            Spacer()
          }
        }
    }
    .ignoresSafeArea()
  }
  
  private var thirdOnboardingState: some View {
    VStack {
      Image("onboarding3")
        .resizable()
        .scaledToFit()
      Spacer()
      Rectangle()
        .foregroundColor(Colors.primaryBlue)
        .frame(height: 375)
        .cornerRadius(40)
        .overlay {
          VStack {
            Spacer()
            Text("To Look Up More Events or Activities Nearby By Map")
              .multilineTextAlignment(.center)
              .font(.system(size: 22, weight: .medium))
              .foregroundColor(.white)
              .padding(.top, 30)
            
            Text("In publishing and graphic design, Lorem is \na placeholder text commonly ")
              .font(.system(size: 15, weight: .regular))
              .multilineTextAlignment(.center)
              .foregroundColor(.white)
              .padding(.top, 16)
            
            HStack {
              Spacer()
              Text("Skip")
                .font(.system(size: 18, weight: .medium))
                .foregroundColor(.white)
              Spacer()
              Spacer()
              SegmentProgressView(segmentValue: $onboardingState)
              Spacer()
              Spacer()
              Text("Next")
                .font(.system(size: 18, weight: .medium))
                .foregroundColor(.white)
                .onTapGesture {
                  self.onboardingState += 1
                }
              Spacer()
            }
            .padding(.top, 40)
            Spacer()
          }
        }
    }
    .ignoresSafeArea()
  }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
