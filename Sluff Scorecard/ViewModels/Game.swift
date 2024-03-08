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
    var playersList: [Player] = [Player(name:"Player1", isDealer: true), Player(name:"Player2", isDealer: false), Player(name:"Player3", isDealer: false), Player(name:"Player4", isDealer: false), Player(name:"Player5", isDealer: false), Player(name:"Player6", isDealer: false)]
    var runningScores: [RunningScores] = [RunningScores(round: 1, t1ChangeInScore: 0, t1Score: 0, t2ChangeInScore: 0, t2Score: 0)]
    var numberOfPlayers: Int = 6
    
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
    var team1TricksWonStr: String = "--" // The total tricks won for a team on that round
    var team2TricksWonStr: String = "--"
    var team1SluffsWonStr: String = "--" // The total sluffs won for a team on that round
    var team2SluffsWonStr: String = "--"
    var round: Int = 1 // What is the current round
    var gameOver: Bool = false
    var notAllBid: Bool = true
    var dontUpdateScores: Bool = true
    var winner: String = "Tie"
    
    
    var sluffTeam1ChoiceList: [SluffChoice] = [SluffChoice(option: "0")]
    var sluffTeam2ChoiceList: [SluffChoice] = [SluffChoice(option: "0")]



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
        self.team1TricksWonStr = team1TricksWonStr
        self.team2TricksWonStr = team2TricksWonStr
        self.team1SluffsWonStr = team1SluffsWonStr
        self.team2SluffsWonStr = team2SluffsWonStr
        self.round = round
        self.gameOver = gameOver
        self.notAllBid = notAllBid
        self.winner = winner
        self.runningScores = runningScores
        self.sluffTeam1ChoiceList = sluffTeam1ChoiceList
        self.sluffTeam2ChoiceList = sluffTeam2ChoiceList
    }
    
    
    /// setNumberOfPlayers function with an integer parameter for the number of players in the game. A playersList array of Player structs is formed that contains the appropriate number of players for the game.
    func setNumberOfPlayers() {
        playersList.removeAll()
        runningScores.removeAll()
                
        for index in 1...numberOfPlayers {
            if index == 1{
                playersList.append(Player(name: "Player \(index)", isDealer: true))
            } else {
                playersList.append(Player(name: "Player \(index)", isDealer: false))
            }
        }
        
        for index in 1...numberOfPlayers {

            runningScores.append(RunningScores(round: index, t1ChangeInScore: 0, t1Score: 0, t2ChangeInScore: 0, t2Score: 0))

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
    
    func setSluffOptions() {
        sluffTeam1ChoiceList.removeAll()
        sluffTeam1ChoiceList.append(SluffChoice(option: "--"))
        sluffTeam2ChoiceList.removeAll()
        sluffTeam2ChoiceList.append(SluffChoice(option: "--"))

        
        for index in 0...team1TotalSluffs {
                sluffTeam1ChoiceList.append(SluffChoice(option: String(index)))
                }
        
        for index in 0...team2TotalSluffs {
                sluffTeam2ChoiceList.append(SluffChoice(option: String(index)))
                }
        
    }
    
    
    /// updateScore function calculates the score for each time at the conclusion of a hand and updates each team's total score.
    func updateScore() -> () {

        var team1TrickPoints = 0
        var team1SluffPoints = 0
        var team2TrickPoints = 0
        var team2SluffPoints = 0
        
        let team1TricksWon = Int(team1TricksWonStr)
        let team2TricksWon = 14-team1TricksWon!
        let team1SluffsWon = Int(team1SluffsWonStr)
        let team2SluffsWon = Int(team2SluffsWonStr)
        
        var t1ChangeInScore = 0
        var t2ChangeInScore = 0
        
        // if team1 won the their bid for tricks, they get some points. If not, they get 0.

        // a successful bid gets 10 points for each trick bid + 1 for every bonus trick
        if team1TricksWon! >= team1TotalBid {
            team1TrickPoints = (10 * team1TotalBid) + ((team1TricksWon!)-team1TotalBid)
        } else {
            team1TrickPoints = 0
        }
        
        
        // if team1 won the their bid for tricks, they get some points. If not, they get 0.

        if team1TricksWon! >= team1TotalBid {
            if team1SluffsWon! == team1TotalSluffs {
                team1SluffPoints = team1TotalSluffs * 50
            } else {
                team1SluffPoints = (team1SluffsWon! * 50) - ((team1TotalSluffs - team1SluffsWon!) * 50)
            }
            team1SluffPoints = (team1SluffsWon! * 50) - ((team1TotalSluffs - team1SluffsWon!) * 50)
        } else {
            team1TrickPoints = 0
            team1SluffPoints = 0
        }
        
        t1ChangeInScore = team1TrickPoints + team1SluffPoints
        
        team1TotalScore = team1TotalScore + t1ChangeInScore

// if team2 won the their bid for tricks, they get some points. If not, they get 0.

        if team2TricksWon >= team2TotalBid {
            team2TrickPoints = (10 * team2TotalBid) + (team2TricksWon-team2TotalBid)
        } else {
            team1TrickPoints = 0
        }
        
// if team2 won the their bid for tricks, they get some points. If not, they get 0.
        if team2TricksWon >= team2TotalBid {
            if team2SluffsWon! == team2TotalSluffs {
                team2SluffPoints = team2TotalSluffs * 50
            } else {
                team2SluffPoints = (team2SluffsWon! * 50) - ((team2TotalSluffs - team2SluffsWon!) * 50)
            }
        } else {
            team2TrickPoints = 0
            team2SluffPoints = 0
        }

        t2ChangeInScore = team2TrickPoints + team2SluffPoints

        team2TotalScore = team2TotalScore + t2ChangeInScore
        
        // Update the RunningScore struct in the runningScores array for the history view
        runningScores[round - 1].t1ChangeInScore = t1ChangeInScore
        runningScores[round - 1].t1Score = team1TotalScore
        runningScores[round - 1].t2ChangeInScore = t2ChangeInScore
        runningScores[round - 1].t2Score = team2TotalScore
        
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
        team1TricksWonStr = "--"
        team1SluffsWonStr = "--"
        team2TricksWonStr = "--"
        team2SluffsWonStr = "--"
    }
    
    /// this function moves the dealer indicator to the next player. We call this at the conclusion of each hand.
    func nextDealer() -> () {
        for index in playersList.indices {
            if playersList[index].isDealer == true {
                playersList[index].isDealer = false
                if index+1 < playersList.count {
                    playersList[index+1].isDealer = true
                } else {
                    playersList[0].isDealer = true
                }
                
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
    
    
    /// This function changes the gameOver boolean to true after each of the players in the game had dealt one hand.
    func isGameOver() -> () {
        if round > numberOfPlayers {
           gameOver = true
        }
    }
    
    func declareWinner() -> () {
        if team1TotalScore > team2TotalScore {
            winner = team1Name
        } else if team1TotalScore < team2TotalScore {
            winner = team2Name
        } else {
            winner = "Tie"
        }
    }
    
    func resetGame() -> () {
        team1RoundScore = 0 // The current round score
        team2RoundScore = 0
        team1TotalScore = 0 // The total team score
        team2TotalScore = 0
        team1TotalBid = 0 // The total team bid
        team2TotalBid = 0
        team1TotalSluffs = 0// The total team sluffs
        team2TotalSluffs = 0
        team1TricksWonStr = "--" // The total tricks won for a team on that round
        team2TricksWonStr = "--"
        team1SluffsWonStr = "--" // The total sluffs won for a team on that round
        team2SluffsWonStr = "--"
        round = 1 // What is the current round
        gameOver = false
        notAllBid = true
        dontUpdateScores = true
        winner = ""
    }
   
    
} // end class Game
