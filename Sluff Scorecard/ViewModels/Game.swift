//
//  AppState.swift
//  Sluff Scorecard
//
//  Created by Chad Wallace on 1/31/24.
//

import SwiftUI
import Observation

@Observable
class Game {
    var playersList: [Player] = [Player(name:"Player1"), Player(name:"Player2"), Player(name:"Player3"), Player(name:"Player4"), Player(name:"Player5"), Player(name:"Player6"), Player(name:"Player7"), Player(name:"Player8")]
    var numberOfPlayers: Int = 8
    var numPlayersIsSelected: Bool = false
    
    var team1Name: String = "Team 1"
    var team2Name: String = "Team 2"
    
    var team1RoundScore: Int = 0 // The current round score
    var team2RoundScore: Int = 0
    var team1TotalScore: Int = 0 // The total team score
    var team2TotalScore: Int = 0
    var team1TotalBid: Int = 0 // The total team bid
    var team2TotalBid: Int = 0
    var team1TotalSluffs: Int = 0// The total team sluffs
    var team2TotalSluffs: Int = 0
    var team1TricksWon: Int = 0 // The total tricks won for a team on that round
    var team2TricksWon: Int = 0
    var team1SluffsWon: Int = 0 // The total sluffs won for a team on that round
    var team2SluffsWon: Int = 0
    
    var navPath: [String] = ["ScorecardView"]
    //    var dealerPosition: Int // Position of the current dealer
    //    var round: Int // What is the current round
    
    func setNumberOfPlayers(_ numberOfPlayers: Int) {
        playersList.removeAll()
        
        numPlayersIsSelected = true
        
        for index in 1...numberOfPlayers {
            playersList.append(Player(name: "Player \(index)"))
        }
    } // end func setNumberOfPlayers
    
    func setTeamBids(from playersList: [Player]) -> () {
        team1TotalBid = 0
        team2TotalBid = 0
        team1TotalSluffs = 0
        team2TotalSluffs = 0
        
        for index in playersList.indices {
            
            let sluffOrBid = playersList[index].playerBid
            
            if sluffOrBid == "--" { continue }
            
            if (sluffOrBid == "Sluff") && (index % 2 == 0) {
                    team1TotalSluffs += 1
                } else if (sluffOrBid == "Sluff") && (index % 2 == 1) {
                    team2TotalSluffs += 1
                }
            
            guard let bid = Int(playersList[index].playerBid) else { continue }
            if index % 2 == 0 {
                team1TotalBid += bid
            } else {
                team2TotalBid += bid
            }
        }
    }
    
    func updateScore() -> () {

        var team1TrickPoints = 0
        var team1SluffPoints = 0
        var team2TrickPoints = 0
        var team2SluffPoints = 0

        
        // a successful bid gets 10 points for each trick bid + 1 for every bonus trick
        if team1TricksWon >= team1TotalBid {
            team1TrickPoints = (10 * team1TotalBid) + (team1TricksWon-team1TotalBid)
        } else {
            team1TrickPoints = 0
        }
        
        if team1SluffsWon == team1TotalSluffs {
            team1SluffPoints = team1TotalSluffs * 50
        } else {
            team1SluffPoints = (team1SluffsWon * 50) - ((team1TotalSluffs - team1SluffsWon) * 50)
        }
        
        team1TotalScore = team1TotalScore + team1TrickPoints + team1SluffPoints
        
        if team2TricksWon >= team2TotalBid {
            team2TrickPoints = (10 * team2TotalBid) + (team2TricksWon-team2TotalBid)
        } else {
            team1TrickPoints = 0
        }
        
        if team2SluffsWon == team2TotalSluffs {
            team2SluffPoints = team2TotalSluffs * 50
        } else {
            team2SluffPoints = (team2SluffsWon * 50) - ((team2TotalSluffs - team2SluffsWon) * 50)
        }
        team2TotalScore = team2TotalScore + team2TrickPoints + team2SluffPoints
    }
    
    
} // end class AppState
