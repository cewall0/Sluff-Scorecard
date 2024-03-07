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
    var round: Int
    var t1ChangeInScore: Int
    var t1Score: Int
    var t2ChangeInScore: Int
    var t2Score: Int
}
