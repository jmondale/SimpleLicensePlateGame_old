//
//  StateDescriptions.swift
//  SimpleLicensePlateGame
//
//  Created by Jaye Mondale on 7/13/24.
//

import Foundation

class StateDescriptions {
    static let shared = StateDescriptions()
    private(set) var descriptions: [String: String] = [:]
    
    private init() {
        loadDescriptions()
    }
    
    private func loadDescriptions() {
        if let url = Bundle.main.url(forResource: "StateDescriptions", withExtension: "plist"),
           let data = try? Data(contentsOf: url),
           let plist = try? PropertyListSerialization.propertyList(from: data, options: [], format: nil) as? [String: String] {
            descriptions = plist
        }
    }
}


