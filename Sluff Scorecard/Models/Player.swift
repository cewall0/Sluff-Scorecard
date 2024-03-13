//
//  Person.swift
//  Sluff Scorecard
//
//  Created by Chad Wallace on 1/1/24.
//

import Foundation

// Use Codable so any of the data that is codable can use an extension (encodable) to turn this data into a nice dictionary.
struct Player: Identifiable, Hashable {
    let id = UUID()
    var name: String
    var didSluff = false
    var playerBid: String = "--"
    var checkCircle = false
    var isDealer: Bool
}
