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
                Text("--").tag("--").tint(.black)
                Text("Sluff").tag("Sluff").tint(.black)
                Text("1").tag("1").tint(.black)
                Text("2").tag("2").tint(.black)
                Text("3").tag("3").tint(.black)
                Text("4").tag("4").tint(.black)
                Text("5").tag("5").tint(.black)
                Text("6").tag("6").tint(.black)
                Text("7").tag("7").tint(.black)
                Text("8").tag("8").tint(.black)
                Text("9").tag("9").tint(.black)
                Text("10").tag("10").tint(.black)
                Text("11").tag("11").tint(.black)
                Text("12").tag("12").tint(.black)
                Text("13").tag("13").tint(.black)
                Text("14").tag("14").tint(.black)
                Text("15").tag("15").tint(.black)
            }.onChange(of: game.playersList[playerIndex].playerBid) { _, _ in
                onBidChanged()
                
                
            }
            


        }
    }
}
//#Preview {
//    BidPickerView(appState: AppState(), playerIndex: 0)
//}

