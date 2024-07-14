//
//  ProvinceDetailView.swift
//  SimpleLicensePlateGame
//
//  Created by Jaye Mondale on 7/13/24.
//

import SwiftUI

struct ProvinceDetailView: View {
    var province: Province
    
    var body: some View {
        VStack {
            // Pull-down indicator
            Capsule()
                .frame(width: 40, height: 5)
                .foregroundColor(.gray)
                .padding(.top, 10)
            
            // Province details
            Text(province.name)
                .font(.largeTitle)
                .padding()
            
            Text("Additional information about \(province.name)")
                .padding()
            
            // Province flag image
            if let flagImage = UIImage(named: province.name.lowercased()) {
                Image(uiImage: flagImage)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                    .padding()
            } else {
                Text("Flag image not available")
                    .foregroundColor(.red)
                    .padding()
            }
            
            Spacer()
        }
        .padding()
    }
}

