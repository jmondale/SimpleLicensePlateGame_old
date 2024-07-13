//
//  StateViewModel.swift
//  SimpleLicensePlateGame
//
//  Created by Jaye Mondale on 7/13/24.
//

import SwiftUI

class StateViewModel: ObservableObject {
    @Published var states: [USState] {
        didSet {
            saveStates()
        }
    }
    
    @Published var provinces: [Province] {
        didSet {
            saveProvinces()
        }
    }
    
    @Published var selectedState: USState?
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
    
    func toggleFound(for state: USState) {
        if let index = states.firstIndex(where: { $0.id == state.id }) {
            states[index].isFound.toggle()
        }
    }
    
    func toggleFound(for province: Province) {
        if let index = provinces.firstIndex(where: { $0.id == province.id }) {
            provinces[index].isFound.toggle()
        }
    }
    
    func selectState(_ state: USState) {
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
    
    private static func loadStates() -> [USState] {
        if let savedStates = UserDefaults.standard.data(forKey: "states"),
           let decodedStates = try? JSONDecoder().decode([USState].self, from: savedStates) {
            return decodedStates
        } else {
            return [
                USState(name: "Alabama", isFound: false),
                USState(name: "Alaska", isFound: false),
                USState(name: "Arizona", isFound: false),
                USState(name: "Arkansas", isFound: false),
                USState(name: "California", isFound: false),
                USState(name: "Colorado", isFound: false),
                USState(name: "Connecticut", isFound: false),
                USState(name: "Delaware", isFound: false),
                USState(name: "Florida", isFound: false),
                USState(name: "Georgia", isFound: false),
                USState(name: "Hawaii", isFound: false),
                USState(name: "Idaho", isFound: false),
                USState(name: "Illinois", isFound: false),
                USState(name: "Indiana", isFound: false),
                USState(name: "Iowa", isFound: false),
                USState(name: "Kansas", isFound: false),
                USState(name: "Kentucky", isFound: false),
                USState(name: "Louisiana", isFound: false),
                USState(name: "Maine", isFound: false),
                USState(name: "Maryland", isFound: false),
                USState(name: "Massachusetts", isFound: false),
                USState(name: "Michigan", isFound: false),
                USState(name: "Minnesota", isFound: false),
                USState(name: "Mississippi", isFound: false),
                USState(name: "Missouri", isFound: false),
                USState(name: "Montana", isFound: false),
                USState(name: "Nebraska", isFound: false),
                USState(name: "Nevada", isFound: false),
                USState(name: "New Hampshire", isFound: false),
                USState(name: "New Jersey", isFound: false),
                USState(name: "New Mexico", isFound: false),
                USState(name: "New York", isFound: false),
                USState(name: "North Carolina", isFound: false),
                USState(name: "North Dakota", isFound: false),
                USState(name: "Ohio", isFound: false),
                USState(name: "Oklahoma", isFound: false),
                USState(name: "Oregon", isFound: false),
                USState(name: "Pennsylvania", isFound: false),
                USState(name: "Rhode Island", isFound: false),
                USState(name: "South Carolina", isFound: false),
                USState(name: "South Dakota", isFound: false),
                USState(name: "Tennessee", isFound: false),
                USState(name: "Texas", isFound: false),
                USState(name: "Utah", isFound: false),
                USState(name: "Vermont", isFound: false),
                USState(name: "Virginia", isFound: false),
                USState(name: "Washington", isFound: false),
                USState(name: "West Virginia", isFound: false),
                USState(name: "Wisconsin", isFound: false),
                USState(name: "Wyoming", isFound: false),
                USState(name: "Washington, D.C.", isFound: false)
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

