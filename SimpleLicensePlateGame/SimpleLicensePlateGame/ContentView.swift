//
//  ContentView.swift
//  SimpleLicensePlateGame
//
//  Created by Jaye Mondale on 7/13/24.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject private var viewModel = StateViewModel()
    
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                ZStack {
                    List {
                        // States Score Section
                        statesScoreSectionView
                        
                        // States list section
                        statesSectionView
                            
                        // Province Score Section
                        provinceScoreSectionView
                        
                        // States list section
                        provinceSectionView
                        
                    }
                    .navigationTitle("License Plates")
                    .listStyle(.plain)
                    .sheet(item: $viewModel.selectedState) { state in
                        StateDetailView(state: state)
                    }
                    .sheet(item: $viewModel.selectedProvince) { province in
                        ProvinceDetailView(province: province)
                    }
                }
                .frame(width: geometry.size.width)
                .background(Color.appBackground)
            }
        }
    }
    
    private var statesScoreSectionView: some View {
        Section(header: Text("States Score")
            .font(.headline)
            .foregroundColor(.appPrimary)
            //.background(Color.clear)
            .padding()
        ) {
            VStack(alignment: .leading) {
                ScoreView(total: viewModel.totalStates, found: viewModel.foundStates)
                
            }
            //.padding()
        }
        .listRowBackground(Color.appBackground)
    }
    
    private var statesSectionView: some View {
        Section(header: Text("States")
            .font(.headline)
            .foregroundColor(.appPrimary)
            .background(Color.clear)
            .padding()
        ) {
            ForEach(viewModel.states) { state in
                StateRow(viewModel: viewModel, state: state)
            }
            .listRowBackground(Color.appBackground)
        }
        
    }
    
    private var provinceScoreSectionView: some View {
        Section {
            VStack(alignment: .leading) {
                Text("Provinces Score")
                    .font(.headline)
                    .padding(.leading)
                ScoreView(total: viewModel.totalProvinces, found: viewModel.foundProvinces)
            }
            .padding(.bottom, 10)
        }
    }
    
    private var provinceSectionView: some View {
        Section(header: Text("Provinces")
            .padding()
        ) {
            ForEach(viewModel.provinces) { province in
                ProvinceRow(viewModel: viewModel, province: province)
            }
        }
    }
}


#Preview {
    ContentView()
}
