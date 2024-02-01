//
//  NumPlayersPickerView.swift
//  Sluff Scorecard
//
//  Created by Chad Wallace on 1/31/24.
//

import SwiftUI

// This view is required because although appState is in the environment, the NumPlayersView cannot bind to it in the same view. We need to make a separate view for the bindable parts like the picker. I will probably need to do this in the AddPlayerView for adding the players names.

struct NumPlayersPickerView: View {
    
    @Bindable var appState: AppState
    
    
    var body: some View {
        VStack{
            
            HStack {
                Text("Number of Players:")
                Text(String(appState.numberOfPlayers))
            }
            
            Picker("Number of Players", selection: $appState.numberOfPlayers) {
                Text("6")
                    .tag(6)
                
                Text("8")
                    .tag(8)
                
                Text("10")
                    .tag(10)
            }
            
        }
    }
}

#Preview {
    NumPlayersPickerView(appState: AppState())
        
}
