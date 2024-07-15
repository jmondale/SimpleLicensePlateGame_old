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
                USState(name: "Arizona", isFound: false, description: descriptions["Arizona"] ?? "Description about Arizona."),
                USState(name: "Arkansas", isFound: false, description: descriptions["Arkansas"] ?? "Description about Arkansas."),
                USState(name: "California", isFound: false, description: descriptions["California"] ?? "Description about California."),
                USState(name: "Colorado", isFound: false, description: descriptions["Colorado"] ?? "Description about Colorado."),
                USState(name: "Connecticut", isFound: false, description: descriptions["Connecticut"] ?? "Description about Connecticut."),
                USState(name: "Delaware", isFound: false, description: descriptions["Delaware"] ?? "Description about Delaware."),
                USState(name: "Florida", isFound: false, description: descriptions["Florida"] ?? "Description about Florida."),
                USState(name: "Georgia", isFound: false, description: descriptions["Georgia"] ?? "Description about Georgia."),
                USState(name: "Hawaii", isFound: false, description: descriptions["Hawaii"] ?? "Description about Hawaii."),
                USState(name: "Idaho", isFound: false, description: descriptions["Idaho"] ?? "Description about Idaho."),
                USState(name: "Illinois", isFound: false, description: descriptions["Illinois"] ?? "Description about Illinois."),
                USState(name: "Indiana", isFound: false, description: descriptions["Indiana"] ?? "Description about Indiana."),
                USState(name: "Iowa", isFound: false, description: descriptions["Iowa"] ?? "Description about Iowa."),
                USState(name: "Kansas", isFound: false, description: descriptions["Kansas"] ?? "Description about Kansas."),
                USState(name: "Kentucky", isFound: false, description: descriptions["Kentucky"] ?? "Description about Kentucky."),
                USState(name: "Louisiana", isFound: false, description: descriptions["Louisiana"] ?? "Description about Louisiana."),
                USState(name: "Maine", isFound: false, description: descriptions["Maine"] ?? "Description about Maine."),
                USState(name: "Maryland", isFound: false, description: descriptions["Maryland"] ?? "Description about Maryland."),
                USState(name: "Massachusetts", isFound: false, description: descriptions["Massachusetts"] ?? "Description about Massachusetts."),
                USState(name: "Michigan", isFound: false, description: descriptions["Michigan"] ?? "Description about Michigan."),
                USState(name: "Minnesota", isFound: false, description: descriptions["Minnesota"] ?? "Description about Minnesota."),
                USState(name: "Mississippi", isFound: false, description: descriptions["Mississippi"] ?? "Description about Mississippi."),
                USState(name: "Missouri", isFound: false, description: descriptions["Missouri"] ?? "Description about Missouri."),
                USState(name: "Montana", isFound: false, description: descriptions["Montana"] ?? "Description about Montana."),
                USState(name: "Nebraska", isFound: false, description: descriptions["Nebraska"] ?? "Description about Nebraska."),
                USState(name: "Nevada", isFound: false, description: descriptions["Nevada"] ?? "Description about Nevada."),
                USState(name: "New Hampshire", isFound: false, description: descriptions["New Hampshire"] ?? "Description about New Hampshire."),
                USState(name: "New Jersey", isFound: false, description: descriptions["New Jersey"] ?? "Description about New Jersey."),
                USState(name: "New Mexico", isFound: false, description: descriptions["New Mexico"] ?? "Description about New Mexico."),
                USState(name: "New York", isFound: false, description: descriptions["New York"] ?? "Description about New York."),
                USState(name: "North Carolina", isFound: false, description: descriptions["North Carolina"] ?? "Description about North Carolina."),
                USState(name: "North Dakota", isFound: false, description: descriptions["North Dakota"] ?? "Description about North Dakota."),
                USState(name: "Ohio", isFound: false, description: descriptions["Ohio"] ?? "Description about Ohio."),
                USState(name: "Oklahoma", isFound: false, description: descriptions["Oklahoma"] ?? "Description about Oklahoma."),
                USState(name: "Oregon", isFound: false, description: descriptions["Oregon"] ?? "Description about Oregon."),
                USState(name: "Pennsylvania", isFound: false, description: descriptions["Pennsylvania"] ?? "Description about Pennsylvania."),
                USState(name: "Rhode Island", isFound: false, description: descriptions["Rhode Island"] ?? "Description about Rhode Island."),
                USState(name: "South Carolina", isFound: false, description: descriptions["South Carolina"] ?? "Description about South Carolina."),
                USState(name: "South Dakota", isFound: false, description: descriptions["South Dakota"] ?? "Description about South Dakota."),
                USState(name: "Tennessee", isFound: false, description: descriptions["Tennessee"] ?? "Description about Tennessee."),
                USState(name: "Texas", isFound: false, description: descriptions["Texas"] ?? "Description about Texas."),
                USState(name: "Utah", isFound: false, description: descriptions["Utah"] ?? "Description about Utah."),
                USState(name: "Vermont", isFound: false, description: descriptions["Vermont"] ?? "Description about Vermont."),
                USState(name: "Virginia", isFound: false, description: descriptions["Virginia"] ?? "Description about Virginia."),
                USState(name: "Washington", isFound: false, description: descriptions["Washington"] ?? "Description about Washington."),
                USState(name: "West Virginia", isFound: false, description: descriptions["West Virginia"] ?? "Description about West Virginia."),
                USState(name: "Wisconsin", isFound: false, description: descriptions["Wisconsin"] ?? "Description about Wisconsin."),
                USState(name: "Wyoming", isFound: false, description: descriptions["Wyoming"] ?? "Description about Wyoming."),
                USState(name: "Washington, D.C.", isFound: false, description: descriptions["Washington, D.C."] ?? "Description about Washington, D.C..")]
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
                Province(name: "Alberta", isFound: false, description: descriptions["Alberta"] ?? "Description about Alberta."),
                Province(name: "British Columbia", isFound: false, description: descriptions["British Columbia"] ?? "Description about British Columbia."),
                Province(name: "Manitoba", isFound: false, description: descriptions["Manitoba"] ?? "Description about Manitoba."),
                Province(name: "New Brunswick", isFound: false, description: descriptions["New Brunswick"] ?? "Description about New Brunswick."),
                Province(name: "Newfoundland and Labrador", isFound: false, description: descriptions["Newfoundland and Labrador"] ?? "Description about Newfoundland and Labrado."),
                Province(name: "Nova Scotia", isFound: false, description: descriptions["Nova Scotia"] ?? "Description about Nova Scotia."),
                Province(name: "Ontario", isFound: false, description: descriptions["Ontario"] ?? "Description about Ontario."),
                Province(name: "Prince Edward Island", isFound: false, description: descriptions["Prince Edward Island"] ?? "Description about Prince Edward Island."),
                Province(name: "Quebec", isFound: false, description: descriptions["Quebec"] ?? "Description about Quebec."),
                Province(name: "Saskatchewan", isFound: false, description: descriptions["Saskatchewan"] ?? "Description about Saskatchewan.")
            ]
        }
    }
}

