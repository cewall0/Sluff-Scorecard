//
//  AddPlayerView.swift
//  Sluff Scorecard
//
//  Created by Chad Wallace on 1/30/24.
//

import SwiftUI
import Observation


struct AddPlayerView: View {
    
//    @Bindable private var viewModel = GameViewModel()
    @Environment(AppState.self) private var appState

    var body: some View {
        
        NavigationView {
            
            VStack{
                Form{
                    VStack{
                        Text("Setup Players")
                            .font(.title)
                        Text(" ")
                        Text("Add player names starting with first dealer in position 1.")
                            .font(.title3)
                        Text(" ")
                        Text(" ")
                        
                        EditablePlayerListView(appState: appState)
                        
                        NavigationLink("Go to Sluff Scorecard") {
                            ScorecardView()
                        }
                        .padding()
                        .foregroundColor(.white)
                        .background(.blue)
                        .clipShape(Capsule())
                        .padding()

//                        List(appState.playersList) { player in
//                            Text(player.name)
//                        }
//                        ForEach(appState.playersList) { $player in
//                            TextField("Hint", text: appState.player.name)
//                        }
                    } // end VStack
                    
                    
                    Spacer()
                    
                    
                } // end Form
            } // end VStack
        }// end Navigation View
    }
}

#Preview {
    AddPlayerView()
        .environment(AppState())
}
