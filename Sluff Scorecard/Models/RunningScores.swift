//
//  RunningScores.swift
//  Sluff Scorecard
//
//  Created by Chad Wallace on 3/7/24.
//

import Foundation


// Use Codable so any of the data that is codable can use an extension (encodable) to turn this data into a nice dictionary.
struct RunningScores: Identifiable {
    let id = UUID()
    var thisRound: Int
    var t1ChangeInScore: Int
    var t1RoundScore: Int
    var t1TricksBidStr: String
    var t1TricksBid: Int
    var t1TricksWonStr: String
    var t1TricksWon: Int
    var t1TrickPoints: Int
    var t1SluffsBidStr: String
    var t1SluffsBid: Int
    var t1SluffsWonStr: String
    var t1SluffsWon: Int
    var t1SluffPoints: Int
    var t2ChangeInScore: Int
    var t2RoundScore: Int
    var t2TricksBidStr: String
    var t2TricksBid: Int
    var t2TricksWonStr: String
    var t2TricksWon: Int
    var t2TrickPoints: Int
    var t2SluffsBidStr: String
    var t2SluffsBid: Int
    var t2SluffsWonStr: String
    var t2SluffsWon: Int
    var t2SluffPoints: Int
}
