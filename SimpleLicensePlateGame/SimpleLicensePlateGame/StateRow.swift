//
//  StateRow.swift
//  SimpleLicensePlateGame
//
//  Created by Jaye Mondale on 7/13/24.
//

import SwiftUI

struct StateRow: View {
    @ObservedObject var viewModel: StateViewModel
    var state: State
    
    var body: some View {
        HStack {
            Button(action: {
                viewModel.toggleFound(for: state)
            }) {
                Image(systemName: state.isFound ? "checkmark.circle.fill" : "circle")
                    .foregroundColor(state.isFound ? .green : .gray)
            }
            .buttonStyle(BorderlessButtonStyle())
            
            Text(state.name)
            
            Spacer()
            
            Button(action: {
                viewModel.selectState(state)
            }) {
                Image(systemName: "info.circle")
            }
            .buttonStyle(BorderlessButtonStyle())
        }
        .padding()
        .background(Color.gray.opacity(0.2))
        .cornerRadius(10)
    }
}
