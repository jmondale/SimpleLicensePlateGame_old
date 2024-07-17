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
                //.foregroundColor(.gray)
                .foregroundColor(.secondaryColors)
                .padding(.top, 10)
            
            // Province details
            Text(province.name)
                .font(.largeTitle)
                .foregroundColor(.primaryColors)
                .padding()
            
            Text("Interesting facts about \(province.name)")
                .foregroundColor(.primaryColors)
                .padding()
            
            // Province flag image with background color for contrast
            if let flagImage = UIImage(named: province.name.lowercased()) {
                Image(uiImage: flagImage)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                    .background(Color.secondaryColors.opacity(0.2))
                    .cornerRadius(10)
                    .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                    .padding()
            } else {
                Text("Flag image not available")
                    .foregroundColor(.red)
                    .padding()
            }
            
            // Scrollable description text
            ScrollView {
                Text(province.description)
                    .foregroundColor(.primaryColors)
                    .padding()
            }
            .frame(maxHeight: 400) // Adjust the height as needed
            
            Spacer()
        }
        .padding()
        //.background(Color.gray.opacity(0.1)) // Background color for the entire view
        .background(Color.background)
        .cornerRadius(10) // Optional: To match the image's corner radius
        .padding() // Padding around the entire view to separate it from the edges
            
    }
}

