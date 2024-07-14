//
//  StateDetailView.swift
//  SimpleLicensePlateGame
//
//  Created by Jaye Mondale on 7/13/24.
//

import SwiftUI

struct StateDetailView: View {
    var state: USState
    
    var body: some View {
        VStack {
            // Pull-down indicator
            Capsule()
                .frame(width: 40, height: 5)
                .foregroundColor(.gray)
                .padding(.top, 10)
            
            // State details
            Text(state.name)
                .font(.largeTitle)
                .padding()
            
            Text("Additional information about \(state.name)")
                .padding()
            
            // State flag image with background color for contrast
            if let flagImage = UIImage(named: state.name.lowercased()) {
                Image(uiImage: flagImage)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
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
                Text(state.description)
                    .padding()
            }
            .frame(maxHeight: 400) // Adjust the height as needed
            
            Spacer()
        }
        .padding()
        .background(Color.gray.opacity(0.1)) // Background color for the entire view
        .cornerRadius(10) // Optional: To match the image's corner radius
        .padding() // Padding around the entire view to separate it from the edges
    }
}


