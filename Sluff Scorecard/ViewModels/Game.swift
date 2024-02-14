//
//  AppState.swift
//  Sluff Scorecard
//
//  Created by Chad Wallace on 1/31/24.
//

import SwiftUI
import Observation

@Observable
final class Game {
    var playersList: [Player] = [Player(name:"Player1", isDealer: true), Player(name:"Player2", isDealer: false), Player(name:"Player3", isDealer: false), Player(name:"Player4", isDealer: false), Player(name:"Player5", isDealer: false), Player(name:"Player6", isDealer: false), Player(name:"Player7", isDealer: false), Player(name:"Player8", isDealer: false)]
    var numberOfPlayers: Int = 8
    
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
    var round: Int = 1 // What is the current round
    var gameOver: Bool = false
    var notAllBid: Bool = true
    var dontUpdateScores: Bool = true
    
    

    init() {
        self.playersList = playersList
        self.numberOfPlayers = numberOfPlayers
        self.team1Name = team1Name
        self.team2Name = team2Name
        self.team1RoundScore = team1RoundScore
        self.team2RoundScore = team2RoundScore
        self.team1TotalScore = team1TotalScore
        self.team2TotalScore = team2TotalScore
        self.team1TotalBid = team1TotalBid
        self.team2TotalBid = team2TotalBid
        self.team1TotalSluffs = team1TotalSluffs
        self.team2TotalSluffs = team2TotalSluffs
        self.team1TricksWon = team1TricksWon
        self.team2TricksWon = team2TricksWon
        self.team1SluffsWon = team1SluffsWon
        self.team2SluffsWon = team2SluffsWon
        self.round = round
        self.gameOver = gameOver
        self.notAllBid = notAllBid
    }
    
    
    /// setNumberOfPlayers function with an integer parameter for the number of players in the game. A playersList array of Player structs is formed that contains the appropriate number of players for the game.
    func setNumberOfPlayers(_ numberOfPlayers: Int) {
        playersList.removeAll()
                
        for index in 1...numberOfPlayers {
            if index == 1{
                playersList.append(Player(name: "Player \(index)", isDealer: true))
            } else {
                playersList.append(Player(name: "Player \(index)", isDealer: false))
            }
        }
    } // end func setNumberOfPlayers
    
    
    /// setTeamBids function with a parameter of the playersList array of Player structs. This function keeps track of the current bid for each team (how many tricks they bid they can win) during one round.
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
                continue
                } else if (sluffOrBid == "Sluff") && (index % 2 == 1) {
                    team2TotalSluffs += 1
                    continue
                }
            
            guard let bid = Int(playersList[index].playerBid) else { continue }
            if index % 2 == 0 {
                team1TotalBid += bid
            } else {
                team2TotalBid += bid
            }
        }
    }
    
    
    /// updateScore function calculates the score for each time at the conclusion of a hand and updates each team's total score.
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
        
//        if team1SluffsWon == team1TotalSluffs {
//            team1SluffPoints = team1TotalSluffs * 50
//        } else {
//            team1SluffPoints = (team1SluffsWon * 50) - ((team1TotalSluffs - team1SluffsWon) * 50)
//        }
        team1SluffPoints = (team1SluffsWon * 50) - ((team1TotalSluffs - team1SluffsWon) * 50)
        
        team1TotalScore = team1TotalScore + team1TrickPoints + team1SluffPoints
        
        if team2TricksWon >= team2TotalBid {
            team2TrickPoints = (10 * team2TotalBid) + (team2TricksWon-team2TotalBid)
        } else {
            team1TrickPoints = 0
        }
        
//        if team2SluffsWon == team2TotalSluffs {
//            team2SluffPoints = team2TotalSluffs * 50
//        } else {
//            team2SluffPoints = (team2SluffsWon * 50) - ((team2TotalSluffs - team2SluffsWon) * 50)
//        }
       
        team2SluffPoints = (team2SluffsWon * 50) - ((team2TotalSluffs - team2SluffsWon) * 50)

        team2TotalScore = team2TotalScore + team2TrickPoints + team2SluffPoints
    }
    
    
    /// resetBids function resets the bids and number of sluffs at the conclusion of a round (hand), so the bids and sluffs for the next hand can be shown.
    func resetBids() -> () {
        team1TotalBid = 0
        team2TotalBid = 0
        team1TotalSluffs = 0
        team2TotalSluffs = 0
        notAllBid = true
        
        for index in playersList.indices {
            
            playersList[index].playerBid = "--" // reset all playerBid's to --
            
        }
    }
    
    
    ///This resets the number of tricks and sluffs each team won so we can begin a new hand.
    func resetTricksSluffsWon() -> () {
        team1TricksWon = 0
        team1SluffsWon = 0
        team2TricksWon = 0
        team2SluffsWon = 0
    }
    
    /// this function moves the dealer indicator to the next player. We call this at the conclusion of each hand.
    func nextDealer() -> () {
        for index in playersList.indices {
            if playersList[index].isDealer == true {
                playersList[index].isDealer = false
                playersList[index+1].isDealer = true
                break
            }
        }
        round = round + 1
    }
    
    func checkAllBid() -> () {
        notAllBid = false
        
        for index in playersList.indices {
            
            if playersList[index].playerBid == "--" {
                notAllBid = true
            break
                
            }
        }
    }
    
//    func checkAllScoresEntered() -> () {
//        dontUpdateScores = false
//    
//        if team1TricksWon == "--" || team2TricksWon == "--" ||  team1SluffsWon == "--" || team2SluffsWon == "--" {
//                dontUpdateScores = true
//                
//            }
//        }
//    }
    
    /// This function changes the gameOver boolean to true after each of the players in the game had dealt one hand.
    func isGameOver() -> () {
        if round > numberOfPlayers {
           gameOver = true
        }
    }
    
   
    
} // end class Game
