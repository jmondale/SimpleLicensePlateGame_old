//
//  ProvinceRow.swift
//  SimpleLicensePlateGame
//
//  Created by Jaye Mondale on 7/13/24.
//
import SwiftUI

struct ProvinceRow: View {
    @ObservedObject var viewModel: StateViewModel
    var province: Province
    
    var body: some View {
        HStack {
            Button(action: {
                viewModel.toggleFound(for: province)
            }) {
                Image(systemName: province.isFound ? "checkmark.circle.fill" : "circle")
                    .foregroundColor(province.isFound ? .green : .gray)
            }
            .buttonStyle(BorderlessButtonStyle())
            
            Text(province.name)
            
            Spacer()
            
            Button(action: {
                viewModel.selectProvince(province)
            }) {
                Image(systemName: "info.circle")
            }
            .buttonStyle(BorderlessButtonStyle())
        }
        .padding()
        .foregroundColor(.appPrimary)
        .background(Color.white)
        .cornerRadius(10)
    }
}

