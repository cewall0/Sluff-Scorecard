//
//  BidViewViewModel.swift
//  Sluff Scorecard
//
//  Created by Chad Wallace on 1/27/24.
//

import Foundation
import Observation

@Observable
class BidViewViewModel {
    var bid = 0
    var didSluff = false
    var showAlert = false
    
    init() {
        
    }
    
    func nextBid() {
        guard validateBids() else {
            return
        }
        
        // Go to to the next bidder

        
    } // end func nextBid()
    
    private func validateBids() -> Bool {
        
        if didSluff == true && bid == 0 { // if player is sluffing, their bid must be 0
            return true
        }
        else { // otherwise, the player is not sluffing so they can have any bid
            return false
        }
    }
}
