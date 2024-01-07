//
//  AppState.swift
//  Sluff Scorecard
//
//  Created by Chad Wallace on 1/1/24.
//

import Foundation
import Observation

@Observable
class AppState {
    var person = Player()
    var game = Game()
    
    func fetchPerson() {
        person = Player(name: "Amy")
    }
}
