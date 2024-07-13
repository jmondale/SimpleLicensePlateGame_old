//
//  ContentView.swift
//  SimpleLicensePlateGame
//
//  Created by Jaye Mondale on 7/13/24.
//

import SwiftUI

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = StateViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                VStack(alignment: .leading) {
                    Text("States Score")
                        .font(.headline)
                        .padding(.leading)
                    
                    ScoreView(total: viewModel.totalStates, found: viewModel.foundStates)
                        .padding(.bottom, 10)
                }
                
                List {
                    Section(header: Text("America States")) {
                        ForEach(viewModel.states) { state in
                            StateRow(viewModel: viewModel, state: state)
                        }
                    }
                    
                    // Province Score Section
                    Section {
                        VStack(alignment: .leading) {
                            Text("Provinces Score")
                                .font(.headline)
                                .padding(.leading)
                            
                            ScoreView(total: viewModel.totalProvinces, found: viewModel.foundProvinces)
                        }
                        .padding(.bottom, 10)
                    }
                    
                    Section(header: Text("Canada Provinces")) {
                        ForEach(viewModel.provinces) { province in
                            ProvinceRow(viewModel: viewModel, province: province)
                        }
                    }
                }
                .listStyle(PlainListStyle())
            }
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
