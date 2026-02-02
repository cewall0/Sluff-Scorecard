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
    var runningScores: [RunningScores] = [
        RunningScores(
            thisRound: 1,
            t1ChangeInScore: 0,
            t1RoundScore: 0,
            t1TricksBidStr: "--",
            t1TricksBid: 0,
            t1TricksWonStr: "--",
            t1TricksWon: 0,
            t1TrickPoints: 0,
            t1SluffsBidStr: "--",
            t1SluffsBid: 0,
            t1SluffsWonStr: "--",
            t1SluffsWon: 0,
            t1SluffPoints: 0,
            t2ChangeInScore: 0,
            t2RoundScore: 0,
            t2TricksBidStr: "--",
            t2TricksBid: 0,
            t2TricksWonStr: "--",
            t2TricksWon: 0,
            t2TrickPoints: 0,
            t2SluffsBidStr: "--",
            t2SluffsBid: 0,
            t2SluffsWonStr: "--",
            t2SluffsWon: 0,
            t2SluffPoints: 0
        )
    ]
  
    var numberOfPlayers: Int = 4
    var totalTricks: Int = 14 // The total number of possible tricks in a round. This is changed to 11 for a 10-person game.
    
    var team1Name: String = "Team 1"
    var team2Name: String = "Team 2"
    
    var team1CurrentRoundScore: Int = 0 // The current round score
    var team2CurrentRoundScore: Int = 0
//    var team1CurrentRoundTotalScore: Int = 0 // The total team score
//    var team2CurrentRoundTotalScore: Int = 0
    var team1CurrentRoundTotalBid: Int = 0 // The total team bid
    var team2CurrentRoundTotalBid: Int = 0
    var team1CurrentRoundTotalSluffs: Int = 0// The total team sluffs
    var team2CurrentRoundTotalSluffs: Int = 0
    var team1TricksWonStr: String = "--" // The total tricks won for a team on that round
    var team2TricksWonStr: String = "--"
    var team1SluffsWonStr: String = "--" // The total sluffs won for a team on that round
    var team2SluffsWonStr: String = "--"
    var round: Int = 1 // What is the current round
    var roundToFix: Int = 1 // The round we are fixing if a score needs fixed.
    var gameOver: Bool = false
    var notAllBid: Bool = true
    var dontUpdateScores: Bool = true
    var winner: String = "Tie"
    
    
    var sluffTeam1ChoiceList: [String] = ["--"]
    var sluffTeam2ChoiceList: [String] = ["--"]



    init() {
        self.playersList = playersList
        self.numberOfPlayers = numberOfPlayers
        self.team1Name = team1Name
        self.team2Name = team2Name
        self.team1CurrentRoundScore = team1CurrentRoundScore
        self.team2CurrentRoundScore = team2CurrentRoundScore
//        self.team1CurrentRoundTotalScore = team1CurrentRoundTotalScore
//        self.team2CurrentRoundTotalScore = team2CurrentRoundTotalScore
        self.team1CurrentRoundTotalBid = team1CurrentRoundTotalBid
        self.team2CurrentRoundTotalBid = team2CurrentRoundTotalBid
        self.team1CurrentRoundTotalSluffs = team1CurrentRoundTotalSluffs
        self.team2CurrentRoundTotalSluffs = team2CurrentRoundTotalSluffs
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
        
        // Fix the number of total tricks available for a round. It is always 14 unless 10 players are playing, then there are 11 tricks.
        if numberOfPlayers == 10 {
            totalTricks = 11
        } else {
            totalTricks = 14
        }
                
        for index in 1...numberOfPlayers {
            if index == 1{
                playersList.append(Player(name: "Player \(index)", isDealer: true))
            } else {
                playersList.append(Player(name: "Player \(index)", isDealer: false))
            }
        }
        
       setRunningScores()
        
    } // end func setNumberOfPlayers
    
    func setRunningScores() {
        for index in 1...numberOfPlayers {

            runningScores.append(RunningScores(thisRound: index, t1ChangeInScore: 0, t1RoundScore: 0, t1TricksBidStr: "--", t1TricksBid: 0, t1TricksWonStr: "--", t1TricksWon: 0, t1TrickPoints: 0, t1SluffsBidStr: "--", t1SluffsBid: 0, t1SluffsWonStr: "--", t1SluffsWon: 0, t1SluffPoints: 0, t2ChangeInScore: 0, t2RoundScore: 0, t2TricksBidStr: "--",t2TricksBid: 0, t2TricksWonStr: "--", t2TricksWon: 0, t2TrickPoints: 0, t2SluffsBidStr: "--", t2SluffsBid: 0, t2SluffsWonStr: "--", t2SluffsWon: 0, t2SluffPoints: 0))

        }
    }
    
    
    /// setTeamBids function with a parameter of the playersList array of Player structs. This function keeps track of the current bid for each team (how many tricks they bid and can win) during one round.
    func setTeamBids(from playersList: [Player]) -> () {
        runningScores[round-1].t1TricksBid = 0
        runningScores[round-1].t2TricksBid = 0
        runningScores[round-1].t1SluffsBid = 0
        runningScores[round-1].t2SluffsBid = 0
        
        for index in playersList.indices {
            
            let sluffOrBid = playersList[index].playerBid
            
            if sluffOrBid == "--" { continue }
            
            if (sluffOrBid == "Sluff") && (index % 2 == 0) {
                runningScores[round-1].t1SluffsBid += 1
                runningScores[round-1].t1SluffsBidStr = String(runningScores[round-1].t1SluffsBid)
                continue
                } else if (sluffOrBid == "Sluff") && (index % 2 == 1) {
                    runningScores[round-1].t2SluffsBid += 1
                    runningScores[round-1].t2SluffsBidStr = String(runningScores[round-1].t2SluffsBid)

                    continue
                }
            
            guard let bid = Int(playersList[index].playerBid) else { continue }
            if index % 2 == 0 {
                runningScores[round-1].t1TricksBid += bid
                runningScores[round-1].t1TricksBidStr = String(runningScores[round-1].t1TricksBid)


            } else {
                runningScores[round-1].t2TricksBid += bid
                runningScores[round-1].t2TricksBidStr = String(runningScores[round-1].t2TricksBid)

            }
        }
    }
    
    func setSluffOptions() {
        sluffTeam1ChoiceList.removeAll()
        sluffTeam1ChoiceList.append("--")
        sluffTeam2ChoiceList.removeAll()
        sluffTeam2ChoiceList.append("--")

        
        for index in 0...runningScores[round-1].t1SluffsBid {
                sluffTeam1ChoiceList.append(String(index))
                }
        
        for index in 0...runningScores[round-1].t2SluffsBid {
                sluffTeam2ChoiceList.append(String(index))
                }
        
    }
    
    /// calculateScore function calculates the score for each time at the conclusion of a hand and updates each team's total score.
    func calculateScore() -> () {
        
        for index in 0...(numberOfPlayers-1) { // loop through all of the rounds.
            if runningScores[index].t1TricksWonStr != "--" {
                runningScores[index].t1TricksWon = Int(runningScores[index].t1TricksWonStr)!
                runningScores[index].t2TricksWon = totalTricks-runningScores[index].t1TricksWon
                runningScores[index].t2TricksWonStr = String(runningScores[index].t2TricksWon)
            }
            

            if runningScores[index].t1SluffsWonStr != "--" {
                runningScores[index].t1SluffsWon = Int(runningScores[index].t1SluffsWonStr)!
            }
            
            if runningScores[index].t2SluffsWonStr != "--" {
                runningScores[index].t2SluffsWon = Int(runningScores[index].t2SluffsWonStr)!
            }

            
        // if team1 won the their bid for tricks, they get some points. If not, they get 0.

        // a successful bid gets 10 points for each trick bid + 1 for every bonus trick
            if runningScores[index].t1TricksWon >= runningScores[index].t1TricksBid {
                runningScores[index].t1TrickPoints = (10 * runningScores[index].t1TricksBid) + ((runningScores[index].t1TricksWon)-runningScores[index].t1TricksBid)
        } else {
            runningScores[index].t1TrickPoints = 0
        }
        
        
        // if team1 won the their bid for tricks, they get some points. If not, they get 0.

            if runningScores[index].t1TricksWon >= runningScores[index].t1TricksBid {
                if runningScores[index].t1SluffsWon == runningScores[index].t1SluffsBid {
                    runningScores[index].t1SluffPoints = runningScores[index].t1SluffsWon * 50
            } else {
                runningScores[index].t1SluffPoints = (runningScores[index].t1SluffsWon * 50) - ((runningScores[index].t1SluffsBid - runningScores[index].t1SluffsWon) * 50)
            }
                runningScores[index].t1SluffPoints = (runningScores[index].t1SluffsWon * 50) - ((runningScores[index].t1SluffsBid - runningScores[index].t1SluffsWon) * 50)
        } else {
            runningScores[index].t1TrickPoints = 0
            runningScores[index].t1SluffPoints = 0
        }
        
            runningScores[index].t1ChangeInScore = runningScores[index].t1TrickPoints + runningScores[index].t1SluffPoints
        
            if index >= 1 {
                runningScores[index].t1RoundScore = runningScores[index-1].t1RoundScore + runningScores[index].t1ChangeInScore
            } else {
                runningScores[index].t1RoundScore = runningScores[index].t1ChangeInScore
            }
            

// if team2 won the their bid for tricks, they get some points. If not, they get 0.

            if runningScores[index].t2TricksWon >= runningScores[index].t2TricksBid {
                runningScores[index].t2TrickPoints = (10 * runningScores[index].t2TricksBid) + (runningScores[index].t2TricksWon - runningScores[index].t2TricksBid)
        } else {
            runningScores[index].t2TrickPoints = 0
        }
        
// if team2 won the their bid for tricks, they get some points. If not, they get 0.
            if runningScores[index].t2TricksWon  >= runningScores[index].t2TricksBid {
                if runningScores[index].t2SluffsWon == runningScores[index].t2SluffsBid {
                    runningScores[index].t2SluffPoints = runningScores[index].t2SluffsWon * 50
            } else {
                runningScores[index].t2SluffPoints = (runningScores[index].t2SluffsWon * 50) - ((runningScores[index].t2SluffsBid - runningScores[index].t2SluffsWon) * 50)
            }
        } else {
            runningScores[index].t2TrickPoints = 0
            runningScores[index].t2SluffPoints = 0
        }

        runningScores[index].t2ChangeInScore = runningScores[index].t2TrickPoints + runningScores[index].t2SluffPoints
       
            if index >= 1 {
                runningScores[index].t2RoundScore = runningScores[index-1].t2RoundScore + runningScores[index].t2ChangeInScore
            } else {
                runningScores[index].t2RoundScore = runningScores[index].t2ChangeInScore
            }
            
        
    }// end for loop
        
    }// end calculateScore function
    
    
    /// This function calculated scores for one round, given prior totals
    func calculateRound(
        index: Int,
        previousT1: Int,
        previousT2: Int
    ) {
        // ---- Parse tricks & sluffs ----
        if runningScores[index].t1TricksWonStr != "--" {
            runningScores[index].t1TricksWon = Int(runningScores[index].t1TricksWonStr)!
            runningScores[index].t2TricksWon = totalTricks - runningScores[index].t1TricksWon
            runningScores[index].t2TricksWonStr = String(runningScores[index].t2TricksWon)
        }

        if runningScores[index].t1SluffsWonStr != "--" {
            runningScores[index].t1SluffsWon = Int(runningScores[index].t1SluffsWonStr)!
        }

        if runningScores[index].t2SluffsWonStr != "--" {
            runningScores[index].t2SluffsWon = Int(runningScores[index].t2SluffsWonStr)!
        }

        // ---- Team 1 scoring ----
        if runningScores[index].t1TricksWon >= runningScores[index].t1TricksBid {
            runningScores[index].t1TrickPoints =
                (10 * runningScores[index].t1TricksBid)
                + (runningScores[index].t1TricksWon - runningScores[index].t1TricksBid)

            runningScores[index].t1SluffPoints =
                (runningScores[index].t1SluffsWon * 50)
                - ((runningScores[index].t1SluffsBid - runningScores[index].t1SluffsWon) * 50)
        } else {
            runningScores[index].t1TrickPoints = 0
            runningScores[index].t1SluffPoints = 0
        }

        runningScores[index].t1ChangeInScore =
            runningScores[index].t1TrickPoints + runningScores[index].t1SluffPoints

        runningScores[index].t1RoundScore =
            previousT1 + runningScores[index].t1ChangeInScore

        // ---- Team 2 scoring ----
        if runningScores[index].t2TricksWon >= runningScores[index].t2TricksBid {
            runningScores[index].t2TrickPoints =
                (10 * runningScores[index].t2TricksBid)
                + (runningScores[index].t2TricksWon - runningScores[index].t2TricksBid)

            runningScores[index].t2SluffPoints =
                (runningScores[index].t2SluffsWon * 50)
                - ((runningScores[index].t2SluffsBid - runningScores[index].t2SluffsWon) * 50)
        } else {
            runningScores[index].t2TrickPoints = 0
            runningScores[index].t2SluffPoints = 0
        }

        runningScores[index].t2ChangeInScore =
            runningScores[index].t2TrickPoints + runningScores[index].t2SluffPoints

        runningScores[index].t2RoundScore =
            previousT2 + runningScores[index].t2ChangeInScore
    }
    
    /// This function recalculates all scores starting from an edited round
    func recalculateScores(from editedRound: Int) {
        let startIndex = editedRound - 1
        guard startIndex >= 0 else { return }

        var currentT1 =
            startIndex > 0 ? runningScores[startIndex - 1].t1RoundScore : 0
        var currentT2 =
            startIndex > 0 ? runningScores[startIndex - 1].t2RoundScore : 0

        for index in startIndex..<numberOfPlayers {
            // Clear old totals
            runningScores[index].t1RoundScore = 0
            runningScores[index].t2RoundScore = 0

            calculateRound(
                index: index,
                previousT1: currentT1,
                previousT2: currentT2
            )

            currentT1 = runningScores[index].t1RoundScore
            currentT2 = runningScores[index].t2RoundScore
        }
    }


    
    /// This function resets the player bids so a new round can begin wiht -- for each player's bid in the scorecard.
    func resetPlayerBids() -> () {
        for index in playersList.indices {
            playersList[index].playerBid = "--"
        }
        notAllBid = true
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
            
            // if I am looking at the dealer
            if playersList[index].isDealer == true {
                playersList[index].isDealer = false // make this not the dealer
                if index+1 < playersList.count { // If then next player can still deal because they are not the last dealer...
                    playersList[index+1].isDealer = true // make them the dealer
                } else {
                    playersList[0].isDealer = true // make the first player the dealer getting ready for the next game
                }
                
                break
            }
        }
        
        

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
        if round >= numberOfPlayers {
            gameOver = true
            roundToFix = round // preserve last round
            declareWinner()
        } else {
            round = round + 1
        }
    }
    
    func declareWinner() -> () {
        if runningScores[numberOfPlayers-1].t1RoundScore > runningScores[numberOfPlayers-1].t2RoundScore {
            winner = team1Name
        } else if runningScores[numberOfPlayers-1].t1RoundScore < runningScores[numberOfPlayers-1].t2RoundScore {
            winner = team2Name
        } else {
            winner = "Tie"
        }
    }
    
    func resetGame() -> () {

        round = 1 // What is the current round
        gameOver = false
        notAllBid = true
        dontUpdateScores = true
        winner = ""
        resetPlayerBids()
        runningScores.removeAll()
        setRunningScores()

    }
   
    
} // end class Game
