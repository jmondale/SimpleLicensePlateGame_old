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
        let descriptions = StateDescriptions.shared.descriptions
        self.states = Self.loadStates(descriptions: descriptions)
        self.provinces = Self.loadProvinces(descriptions: descriptions)
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
    
    private static func loadStates(descriptions: [String: String]) -> [USState] {
        if let savedStates = UserDefaults.standard.data(forKey: "states"),
           let decodedStates = try? JSONDecoder().decode([USState].self, from: savedStates) {
            return decodedStates
        } else {
            return [
                USState(name: "Alabama", isFound: false, description: descriptions["Alabama"] ?? "Description about Alabama."),
                USState(name: "Alaska", isFound: false, description: descriptions["Alaska"] ?? "Description about Alaska."),
                USState(name: "Arizona", isFound: false, description: "Description about Alabama."),
                USState(name: "Arkansas", isFound: false, description: "Description about Alabama."),
                USState(name: "California", isFound: false, description: "Description about Alabama."),
                USState(name: "Colorado", isFound: false, description: "Description about Alabama."),
                USState(name: "Connecticut", isFound: false, description: "Description about Alabama."),
                USState(name: "Delaware", isFound: false, description: "Description about Alabama."),
                USState(name: "Florida", isFound: false, description: "Description about Alabama."),
                USState(name: "Georgia", isFound: false, description: "Description about Alabama."),
                USState(name: "Hawaii", isFound: false, description: "Description about Alabama."),
                USState(name: "Idaho", isFound: false, description: "Description about Alabama."),
                USState(name: "Illinois", isFound: false, description: "Description about Alabama."),
                USState(name: "Indiana", isFound: false, description: "Description about Alabama."),
                USState(name: "Iowa", isFound: false, description: "Description about Alabama."),
                USState(name: "Kansas", isFound: false, description: "Description about Alabama."),
                USState(name: "Kentucky", isFound: false, description: "Description about Alabama."),
                USState(name: "Louisiana", isFound: false, description: "Description about Alabama."),
                USState(name: "Maine", isFound: false, description: "Description about Alabama."),
                USState(name: "Maryland", isFound: false, description: "Description about Alabama."),
                USState(name: "Massachusetts", isFound: false, description: "Description about Alabama."),
                USState(name: "Michigan", isFound: false, description: "Description about Alabama."),
                USState(name: "Minnesota", isFound: false, description: "Description about Alabama."),
                USState(name: "Mississippi", isFound: false, description: "Description about Alabama."),
                USState(name: "Missouri", isFound: false, description: "Description about Alabama."),
                USState(name: "Montana", isFound: false, description: "Description about Alabama."),
                USState(name: "Nebraska", isFound: false, description: "Description about Alabama."),
                USState(name: "Nevada", isFound: false, description: "Description about Alabama."),
                USState(name: "New Hampshire", isFound: false, description: "Description about Alabama."),
                USState(name: "New Jersey", isFound: false, description: "Description about Alabama."),
                USState(name: "New Mexico", isFound: false, description: "Description about Alabama."),
                USState(name: "New York", isFound: false, description: "Description about Alabama."),
                USState(name: "North Carolina", isFound: false, description: "Description about Alabama."),
                USState(name: "North Dakota", isFound: false, description: "Description about Alabama."),
                USState(name: "Ohio", isFound: false, description: "Description about Alabama."),
                USState(name: "Oklahoma", isFound: false, description: "Description about Alabama."),
                USState(name: "Oregon", isFound: false, description: "Description about Alabama."),
                USState(name: "Pennsylvania", isFound: false, description: "Description about Alabama."),
                USState(name: "Rhode Island", isFound: false, description: "Description about Alabama."),
                USState(name: "South Carolina", isFound: false, description: "Description about Alabama."),
                USState(name: "South Dakota", isFound: false, description: "Description about Alabama."),
                USState(name: "Tennessee", isFound: false, description: "Description about Alabama."),
                USState(name: "Texas", isFound: false, description: "Description about Alabama."),
                USState(name: "Utah", isFound: false, description: "Description about Alabama."),
                USState(name: "Vermont", isFound: false, description: "Description about Alabama."),
                USState(name: "Virginia", isFound: false, description: "Description about Alabama."),
                USState(name: "Washington", isFound: false, description: "Description about Alabama."),
                USState(name: "West Virginia", isFound: false, description: "Description about Alabama."),
                USState(name: "Wisconsin", isFound: false, description: "Description about Alabama."),
                USState(name: "Wyoming", isFound: false, description: "Description about Alabama."),
                USState(name: "Washington, D.C.", isFound: false, description: "Description about Alabama.")]
        }
    }
    
    private func saveProvinces() {
        if let encoded = try? JSONEncoder().encode(provinces) {
            UserDefaults.standard.set(encoded, forKey: "provinces")
        }
    }
    
    private static func loadProvinces(descriptions: [String: String]) -> [Province] {
        if let savedProvinces = UserDefaults.standard.data(forKey: "provinces"),
           let decodedProvinces = try? JSONDecoder().decode([Province].self, from: savedProvinces) {
            return decodedProvinces
        } else {
            return [
                Province(name: "Alberta", isFound: false, description: "Description about Ontario."),
                Province(name: "British Columbia", isFound: false, description: "Description about Ontario."),
                Province(name: "Manitoba", isFound: false, description: "Description about Ontario."),
                Province(name: "New Brunswick", isFound: false, description: "Description about Ontario."),
                Province(name: "Newfoundland and Labrador", isFound: false, description: "Description about Ontario."),
                Province(name: "Nova Scotia", isFound: false, description: "Description about Ontario."),
                Province(name: "Ontario", isFound: false, description: "Description about Ontario."),
                Province(name: "Prince Edward Island", isFound: false, description: "Description about Ontario."),
                Province(name: "Quebec", isFound: false, description: "Description about Ontario."),
                Province(name: "Saskatchewan", isFound: false, description: "Description about Ontario.")
            ]
        }
    }
}

