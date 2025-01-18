//
//  BidPickerView.swift
//  Sluff Scorecard
//
//  Created by Chad Wallace on 2/1/24.
//

import SwiftUI

struct BidPickerView: View {
    
    @Environment(Game.self) private var game
    @EnvironmentObject var router: Router
    
    @Environment(\.verticalSizeClass) var heightSizeClass: UserInterfaceSizeClass?
    @Environment(\.horizontalSizeClass) var widthSizeClass: UserInterfaceSizeClass?

    var playerIndex: Int
    let onBidChanged: () -> Void
    
    var body: some View {
        @Bindable var game = game

        HStack{

            Picker("Bid:", selection: $game.playersList[playerIndex].playerBid) {
                Text("--").tag("--")
                Text("Sluff").tag("Sluff")
                ForEach(1...game.totalTricks, id:\.self){ bid in
                    Text("\(bid)").tag("\(bid)")
                }.onChange(of: game.playersList[playerIndex].playerBid) { _, _ in
                    onBidChanged()
                }
            }.scaleEffect(widthSizeClass == .regular ? 1.4 : 1.1)
        } // end HStack
        
    }
}
//#Preview {
//    BidPickerView(appState: AppState(), playerIndex: 0)
//}

