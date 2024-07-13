//
//  State.swift
//  SimpleLicensePlateGame
//
//  Created by Jaye Mondale on 7/13/24.
//

import Foundation

struct State: Identifiable, Codable {
    let id: UUID
    let name: String
    var isFound: Bool
    
    init(id: UUID = UUID(), name: String, isFound: Bool) {
        self.id = id
        self.name = name
        self.isFound = isFound
    }
}

