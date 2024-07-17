//
//  ContentView.swift
//  SimpleLicensePlateGame
//
//  Created by Jaye Mondale on 7/13/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = StateViewModel()
    
    var body: some View {
        NavigationView {
            List {
                // States Score Section
                Section {
                    VStack(alignment: .leading) {
                        Text("States Score")
                            .font(.headline)
                            .padding(.leading)
                            .foregroundColor(Color.appPrimary)
                        ScoreView(total: viewModel.totalStates, found: viewModel.foundStates)
                            .padding(.bottom, 10)
                    }
                    
                }
                .background(Color.appBackground)
                
                // States Section
                Section(header: Text("States")
                    .foregroundColor(Color.appPrimary)
                    .padding()
                    .background(Color.appBackground)
                ) {
                    ForEach(viewModel.states) { state in
                        StateRow(viewModel: viewModel, state: state)
                        
                    }
                    .listRowBackground(Color.appBackground.opacity(0.2))
                }
                
                // Province Score Section
                Section {
                    VStack(alignment: .leading) {
                        Text("Provinces Score")
                            .font(.headline)
                            .padding(.leading)
                            .foregroundColor(.primary)
                        ScoreView(total: viewModel.totalProvinces, found: viewModel.foundProvinces)
                    }
                    .padding(.bottom, 10)
                }
                .background(Color.background)
                
                // Provinces Section
                Section(header: Text("Provinces")
                    .foregroundColor(Color.appPrimary)
                    .padding()
                    .background(Color.appBackground)) {
                    ForEach(viewModel.provinces) { province in
                        ProvinceRow(viewModel: viewModel, province: province)
                    }
                    .listRowBackground(Color.appBackground.opacity(0.2))
                }
            }
            .listStyle(PlainListStyle())
            .background(Color.appBackground.edgesIgnoringSafeArea(.all))
            .navigationTitle("License Plates")
            .sheet(item: $viewModel.selectedState) { state in
                StateDetailView(state: state)
            }
            .sheet(item: $viewModel.selectedProvince) { province in
                ProvinceDetailView(province: province)
            }
        }
    }
}


#Preview {
    ContentView()
}
