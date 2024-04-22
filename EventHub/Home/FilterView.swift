//
//  FilterView.swift
//  EventHub
//
//  Created by Yaroslav Orlov on 03.04.2024.
//

import SwiftUI

struct FilterView: View {
    @State var priceRange: Double = 50
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 25) {
            EventClassificationsPicker()
            
            Section("Time & Date") {
                SegmentedPicker()
                
               datePickerButton
            }
            .font(.system(size: 16, weight: .medium))
            
            Section("Location") {
                changeLocationButton
            }
            .font(.system(size: 16, weight: .medium))
            
            priceSlider
            
            buttonsContainer
            
        }
        .padding(.horizontal, 20)
        
        .navigationTitle("Filter")
    }
}

extension FilterView {
    private var changeLocationButton: some View {
        HStack {
            RoundedRectangle(cornerRadius: 12)
                .foregroundColor(Colors.lightBlue)
                .opacity(0.5)
                .frame(width: 30, height: 30)
                .overlay {
                    SwiftUI.Image("location")
                        .resizable()
                        .renderingMode(.template)
                        .foregroundColor(Colors.primaryBlue)
                        .scaledToFit()
                        .frame(width: 15, height: 15)
                }
                .padding(.vertical, 10)
                .padding(.leading, 10)
            Text("New Yourk, USA")
                .font(.system(size: 16, weight: .medium))
            Spacer()
            SwiftUI.Image(systemName: "chevron.right")
                .foregroundColor(Colors.primaryBlue)
                .padding(.trailing, 10)
        }
        .frame(maxWidth: UIScreen.main.bounds.width - 40)
        .overlay {
            RoundedRectangle(cornerRadius: 15)
                .stroke(Color.gray, lineWidth: 1)
        }
    }
    
    private var priceSlider: some View {
        VStack(spacing: 15) {
            HStack {
                Text("Select price")
                    .font(.system(size: 16, weight: .medium))
                Spacer()
                Text("\(priceRange, specifier: "%.0f") $")
                    .font(.system(size: 16, weight: .medium))
                    .foregroundColor(Colors.primaryBlue)
            }
            Slider(value: $priceRange, in: 1...100) {
                Text("slider")
            } minimumValueLabel: {
                Text("1")
            } maximumValueLabel: {
                Text("100")
            }
            .tint(Colors.primaryBlue)
        }
    }
    
    private var buttonsContainer: some View {
        HStack(spacing: 20) {
            Button(action: {}) {
                Text("RESET")
                    .font(.system(size: 16, weight: .medium))
                    .foregroundColor(.black)
                    .padding()
                    .frame(width: UIScreen.main.bounds.width / 2 - 40)
                    .overlay {
                        RoundedRectangle(cornerRadius: 14)
                            .stroke(Color.gray, lineWidth: 1)
                    }
                    
            }
            
            Button(action: {}) {
                Text("APPLY")
                    .font(.system(size: 16, weight: .medium))
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: UIScreen.main.bounds.width / 2 - 40)
                    .background(Colors.primaryBlue)
                    .cornerRadius(14)
                    .overlay {
                        RoundedRectangle(cornerRadius: 14)
                            .stroke(Color.gray, lineWidth: 1)
                    }
                    
            }
            
            
        }
    }
    
    private var datePickerButton: some View {
        HStack {
            SwiftUI.Image("eventDate")
                .resizable()
                .scaledToFit()
                .frame(width: 21, height: 23)
                .padding(.vertical, 10)
                .padding(.leading, 10)
            Text("Choose from calender")
                .font(.system(size: 15, weight: .regular))
                .foregroundColor(.gray)
            Spacer()
            SwiftUI.Image(systemName: "chevron.right")
                .foregroundColor(Colors.primaryBlue)
                .padding(.trailing, 10)
        }
        .overlay {
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.gray, lineWidth: 1)
        }
    }
}

struct FilterView_Previews: PreviewProvider {
    static var previews: some View {
        FilterView()
    }
}
