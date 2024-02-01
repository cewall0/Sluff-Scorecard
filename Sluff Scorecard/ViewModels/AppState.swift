//
//  AppState.swift
//  Sluff Scorecard
//
//  Created by Chad Wallace on 1/31/24.
//

import SwiftUI
import Observation

@Observable
class AppState {
    var playersList: [Player] = [Player(name:"Player1")]
    var numberOfPlayers: Int = 0
    var numPlayersIsSelected: Bool = false

    func setNumberOfPlayers(_ numberOfPlayers: Int) {
        playersList.removeAll()
        
        numPlayersIsSelected = true

        for index in 1...numberOfPlayers {
            playersList.append(Player(name: "Player \(index)"))
        }
    }
}
