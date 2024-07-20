//
//  ScoreView.swift
//  SimpleLicensePlateGame
//
//  Created by Jaye Mondale on 7/13/24.
//

import SwiftUI

struct ScoreView: View {
    let total: Int
    let found: Int
    
    var body: some View {
        HStack {
            Spacer()
            VStack {
                Text("Total")
                Text("\(total)")
            }
            Spacer()
            VStack {
                Text("Score")
                Text("\(found)")
            }
            Spacer()
        }
        .padding()
        .background(Color.white)
        .foregroundColor(Color.appSecondary)
        .cornerRadius(10)
        //.padding([.leading, .trailing])
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
    }
}

