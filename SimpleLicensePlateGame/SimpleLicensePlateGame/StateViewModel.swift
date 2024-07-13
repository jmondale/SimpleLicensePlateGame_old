//
//  StateViewModel.swift
//  SimpleLicensePlateGame
//
//  Created by Jaye Mondale on 7/13/24.
//

import SwiftUI

class StateViewModel: ObservableObject {
    @Published var states: [State] {
        didSet {
            saveStates()
        }
    }
    
    @Published var selectedState: State? // Track the selected state
    
    init() {
        self.states = Self.loadStates()
    }
    
    var total: Int {
        states.count
    }
    
    var found: Int {
        states.filter { $0.isFound }.count
    }
    
    func toggleFound(for state: State) {
        if let index = states.firstIndex(where: { $0.id == state.id }) {
            states[index].isFound.toggle()
        }
    }
    
    func selectState(_ state: State) {
        selectedState = state
    }
    
    private func saveStates() {
        if let encoded = try? JSONEncoder().encode(states) {
            UserDefaults.standard.set(encoded, forKey: "states")
        }
    }
    
    private static func loadStates() -> [State] {
        if let savedStates = UserDefaults.standard.data(forKey: "states"),
           let decodedStates = try? JSONDecoder().decode([State].self, from: savedStates) {
            return decodedStates
        } else {
            return [
                State(name: "Alabama", isFound: false),
                State(name: "Alaska", isFound: false),
                State(name: "Arizona", isFound: false),
                State(name: "Arkansas", isFound: false),
                State(name: "California", isFound: false),
                State(name: "Colorado", isFound: false),
                State(name: "Connecticut", isFound: false),
                State(name: "Delaware", isFound: false),
                State(name: "Florida", isFound: false),
                State(name: "Georgia", isFound: false),
                State(name: "Hawaii", isFound: false),
                State(name: "Idaho", isFound: false),
                State(name: "Illinois", isFound: false),
                State(name: "Indiana", isFound: false),
                State(name: "Iowa", isFound: false),
                State(name: "Kansas", isFound: false),
                State(name: "Kentucky", isFound: false),
                State(name: "Louisiana", isFound: false),
                State(name: "Maine", isFound: false),
                State(name: "Maryland", isFound: false),
                State(name: "Massachusetts", isFound: false),
                State(name: "Michigan", isFound: false),
                State(name: "Minnesota", isFound: false),
                State(name: "Mississippi", isFound: false),
                State(name: "Missouri", isFound: false),
                State(name: "Montana", isFound: false),
                State(name: "Nebraska", isFound: false),
                State(name: "Nevada", isFound: false),
                State(name: "New Hampshire", isFound: false),
                State(name: "New Jersey", isFound: false),
                State(name: "New Mexico", isFound: false),
                State(name: "New York", isFound: false),
                State(name: "North Carolina", isFound: false),
                State(name: "North Dakota", isFound: false),
                State(name: "Ohio", isFound: false),
                State(name: "Oklahoma", isFound: false),
                State(name: "Oregon", isFound: false),
                State(name: "Pennsylvania", isFound: false),
                State(name: "Rhode Island", isFound: false),
                State(name: "South Carolina", isFound: false),
                State(name: "South Dakota", isFound: false),
                State(name: "Tennessee", isFound: false),
                State(name: "Texas", isFound: false),
                State(name: "Utah", isFound: false),
                State(name: "Vermont", isFound: false),
                State(name: "Virginia", isFound: false),
                State(name: "Washington", isFound: false),
                State(name: "West Virginia", isFound: false),
                State(name: "Wisconsin", isFound: false),
                State(name: "Wyoming", isFound: false),
                State(name: "Washington, D.C.", isFound: false)
            ]
        }
    }
}

