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
                ScoreView(total: viewModel.total, found: viewModel.found)
                List {
                    ForEach(viewModel.states) { state in
                        StateRow(viewModel: viewModel, state: state)
                    }
                }
            }
            .navigationTitle("License Plates")
            .sheet(item: $viewModel.selectedState) { state in
                StateDetailView(state: state)
            }
        }
    }
}



#Preview {
    ContentView()
}
