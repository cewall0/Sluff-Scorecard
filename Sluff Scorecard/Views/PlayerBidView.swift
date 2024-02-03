//
//  BidView.swift
//  Sluff Scorecard
//
//  Created by Chad Wallace on 1/27/24.
//

import SwiftUI
import Observation

struct PlayerBidView: View {
    
    @Environment(AppState.self) private var appState
    @State var player: Player
    
    var body: some View {
        VStack{
            Text("Player Bid")
                .font(.system(size: 32))
                .bold()
                .padding(.vertical, 10)
            
//            BidPickerView(appState: appState)
                    
                Text("Toggle isSluffing View")
//                Toggle("Is Sluffing", isOn: $appState.didSluff)
                
                Button("Next Bid") {
                    // send to Next person
                }.padding()
           
        } // end VStack
    } // end body: some View
} // end struct NewItemView

//#Preview {
//    PlayerBidView(player: Player())
//        .environment(AppState())
//}
