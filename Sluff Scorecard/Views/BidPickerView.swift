//
//  BidPickerView.swift
//  Sluff Scorecard
//
//  Created by Chad Wallace on 2/1/24.
//

import SwiftUI

struct BidPickerView: View {
    
    @Bindable var game: Game
    var playerIndex: Int
    let onBidChanged: () -> Void
    
    var body: some View {
        HStack {
            Picker("Bid:", selection: $game.playersList[playerIndex].playerBid) {
//                Text("--").tag("--")
//                Text("Sluff").tag("Sluff")
                Text("0").tag("0")
                Text("1").tag("1")
                Text("2").tag("2")
                Text("3").tag("3")
                Text("4").tag("4")
                Text("5").tag("5")
                Text("6").tag("6")
                Text("7").tag("7")
                Text("8").tag("8")
                Text("9").tag("9")
                Text("10").tag("10")
            }.onChange(of: game.playersList[playerIndex].playerBid) { _, _ in
                onBidChanged()
            }
        }
    }
}
//#Preview {
//    BidPickerView(appState: AppState(), playerIndex: 0)
//}

