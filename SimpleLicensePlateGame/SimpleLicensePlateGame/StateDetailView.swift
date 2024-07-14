//
//  StateDetailView.swift
//  SimpleLicensePlateGame
//
//  Created by Jaye Mondale on 7/13/24.
//

import SwiftUI

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
            
            // State flag image
            if let flagImage = UIImage(named: state.name.lowercased()) {
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


