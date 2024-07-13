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
    
    @Published var provinces: [Province] {
        didSet {
            saveProvinces()
        }
    }
    
    @Published var selectedState: State?
    @Published var selectedProvince: Province?
    
    init() {
        self.states = Self.loadStates()
        self.provinces = Self.loadProvinces()
    }
    
    var totalStates: Int {
        states.count
    }
    
    var foundStates: Int {
        states.filter { $0.isFound }.count
    }
    
    var totalProvinces: Int {
        provinces.count
    }
    
    var foundProvinces: Int {
        provinces.filter { $0.isFound }.count
    }
    
    func toggleFound(for state: State) {
        if let index = states.firstIndex(where: { $0.id == state.id }) {
            states[index].isFound.toggle()
        }
    }
    
    func toggleFound(for province: Province) {
        if let index = provinces.firstIndex(where: { $0.id == province.id }) {
            provinces[index].isFound.toggle()
        }
    }
    
    func selectState(_ state: State) {
        selectedState = state
    }
    
    func selectProvince(_ province: Province) {
        selectedProvince = province
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
                State(name: "Alabama", isFound: true),
                State(name: "Alaska", isFound: true),
                State(name: "Arizona", isFound: false),
                // Add the rest of the states
            ]
        }
    }
    
    private func saveProvinces() {
        if let encoded = try? JSONEncoder().encode(provinces) {
            UserDefaults.standard.set(encoded, forKey: "provinces")
        }
    }
    
    private static func loadProvinces() -> [Province] {
        if let savedProvinces = UserDefaults.standard.data(forKey: "provinces"),
           let decodedProvinces = try? JSONDecoder().decode([Province].self, from: savedProvinces) {
            return decodedProvinces
        } else {
            return [
                Province(name: "Ontario", isFound: false),
                Province(name: "Quebec", isFound: false),
                Province(name: "British Columbia", isFound: false),
                // Add the rest of the provinces
            ]
        }
    }
}

