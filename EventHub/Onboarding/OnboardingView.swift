//
//  OnboardingView.swift
//  EventHub
//
//  Created by Yaroslav Orlov on 06.04.2023.
//

import SwiftUI

struct OnboardingView: View {
    @Environment(\.router) var router
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
            default:
                firstOnboardingState
            }
        }
    }
}

extension OnboardingView {
    
    private var firstOnboardingState: some View {
        GeometryReader { geo in
            VStack {
                SwiftUI.Image("onboarding1")
                    .resizable()
                    .scaledToFit()
                    .frame(height: geo.size.height * 0.7)
                Spacer()
                Rectangle()
                    .foregroundColor(Colors.primaryBlue)
                    .cornerRadius(40, corners: [.topLeft, .topRight])
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
    }
    
    private var secondOnboardingState: some View {
        GeometryReader { geo in
            VStack {
                SwiftUI.Image("onboarding2")
                    .resizable()
                    .scaledToFit()
                    .frame(height: geo.size.height * 0.7)
                Spacer()
                Rectangle()
                    .foregroundColor(Colors.primaryBlue)
                    .cornerRadius(40, corners: [.topLeft, .topRight])
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
                                    .onTapGesture {
                                        onboardingState = 1
                                    }
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
    
    private var thirdOnboardingState: some View {
        GeometryReader { geo in
            VStack {
                SwiftUI.Image("onboarding3")
                    .resizable()
                    .scaledToFit()
                    .frame(height: geo.size.height * 0.7)
                Spacer()
                Rectangle()
                    .foregroundColor(Colors.primaryBlue)
                    .cornerRadius(40, corners: [.topLeft, .topRight])
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
                                        router.showScreen(.push) { _ in
                                            AuthenticationView()
                                        }
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
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
