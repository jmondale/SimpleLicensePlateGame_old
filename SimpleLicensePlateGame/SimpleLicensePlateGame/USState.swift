//
//  State.swift
//  SimpleLicensePlateGame
//
//  Created by Jaye Mondale on 7/13/24.
//

import Foundation

struct USState: Identifiable, Codable {
    let id: UUID
    let name: String
    var isFound: Bool
    var description: String
    
    init(id: UUID = UUID(), name: String, isFound: Bool, description: String) {
        self.id = id
        self.name = name
        self.isFound = isFound
        self.description = description
    }
}

