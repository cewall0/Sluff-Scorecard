//
//  Game.swift
//  Sluff Scorecard
//
//  Created by Chad Wallace on 1/1/24.
//

//import Foundation

// Use Codable so any of the data that is codable can use an extension (encodable) to turn this data into a nice dictionary.

//struct Game {
//    var numPlayers: Int //Number of players
//    var team1Name: String// Team Names
//    var team2Name: String
//    var team1RoundScore: Int // The current round score
//    var team2RoundScore: Int
//    var team1TotalScore: Int // The total team score
//    var team2TotalScore: Int
//    var team1TotalBid: Int // The total team bid
//    var team2TotalBid: Int
//    var team1TotalSluffs: Int // The total team sluffs
//    var team2TotalSluffs: Int
//    var team1TricksWon: Int // The total tricks won for a team on that round
//    var team2TricksWon: Int
//    var team1SluffsWon: Int // The total sluffs won for a team on that round
//    var team2SluffsWon: Int
//    var team1SluffsLost: Int // The total sluffs lost for a team on that round
//    var team2SluffsLost: Int
//    var dealerPosition: Int // Position of the current dealer
//    var round: Int // What is the current round
//    var playersList = [Player]()
//}


// ******************************************
// This class is for the Game. This Game class keeps track of all the relevant information for the game and some of the functions that the game does.
// ******************************************

//@Observable
//class Game {
//    
//    // ******************************************
//    // Start Variables
//    // ******************************************
//    
//    var numPlayers: Int = 8 // Number of players
//    var team1Name: String = "" // Team Names
//    var team2Name: String = ""
//    var team1RoundScore: Int = 0 // The current round score
//    var team2RoundScore: Int = 0
//    var team1TotalScore: Int = 0 // The total team score
//    var team2TotalScore: Int = 0
//    var team1TotalBid: Int = 0 // The total team bid
//    var team2TotalBid: Int = 0
//    var team1TotalSluffs: Int = 0 // The total team sluffs
//    var team2TotalSluffs: Int = 0
//    var team1TricksWon: Int = 0 // The total tricks won for a team on that round
//    var team2TricksWon: Int = 0
//    var team1SluffsWon: Int = 0 // The total sluffs won for a team on that round
//    var team2SluffsWon: Int = 0
//    var team1SluffsLost: Int = 0 // The total sluffs lost for a team on that round
//    var team2SluffsLost: Int = 0
//    var dealerPosition: Int = 0 // Position of the current dealer
//    var round: Int = 1 // What is the current round
//
//    
//    // Point Values for the Game
//    
//    let sluffWonPts: Int = 50 // You get 50 points for every sluff you accomplish
//    let sluffLostPts: Int = -50 // You lose 50 points for every sluff you lose
//    let tricksWonOfBidPts: Int = 10 // 10 points added per trick you won that you bid
//    let tricksWonOverBidPts: Int = 1 // 1 point per trick you won over your bid
//    let bidNotMadePts: Int = 0 // Get 0 points for current round if you dont get your tricks and you get -50 for every sluffLost
//    
//    // ******************************************
//    // End Variables
//    // ******************************************
//    
//    // ******************************************
//    // Initializers for the Game class
//    // ******************************************
//    
//    // generic initializer for this class if nothing passed in (giving only default values above)
//    init() {
//        
//    }
//    
//    // ******************************************
//    // Do some things
//    // ******************************************
//    
//    
//    // ******************************************
//    // The functions
//    // ******************************************
//    
//    // getPlayerList is a function that gives an array of Player objects.
//    
////    func getPlayerList() -> [Player] {
////        var i = 1
////        
////        if i < (numPlayers + 1) {
////            let player = Player("player" + String(i), i)
////            self.playersList.append(player)
////            i += 1
////        }
////        
////        return playersList
////         
////    }
//    
//    // Builds all the players
//    
//    // Make an instance for each player
//    
//   
//    
//    
//    
//    
//    // Assign Players to their teams
//    
//    // Give Names for each team
//    
//    // Change Next Dealer
//    
//    // Collects tricks won for each team
//    
//    // Asks about each sluff if its won or loss
//    
//    // Figure round score
//    
//    // Add to the total scores
//} // End Class
