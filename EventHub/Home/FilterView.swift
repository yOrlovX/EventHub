//
//  FilterView.swift
//  EventHub
//
//  Created by Yaroslav Orlov on 03.04.2024.
//

import SwiftUI

struct FilterView: View {
    var body: some View {
        
            VStack(alignment: .leading, spacing: 25) {
                EventClassificationsPicker()
                
                Text("Time & Date")
                    .font(.system(size: 16, weight: .medium))
                
                SegmentedPicker()
                
                Text("Location")
                    .font(.system(size: 16, weight: .medium))
            }
            .padding(.horizontal, 20)
        
        .navigationTitle("Filter")
    }
}

struct FilterView_Previews: PreviewProvider {
    static var previews: some View {
        FilterView()
    }
}
