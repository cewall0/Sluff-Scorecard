//
//  NumPlayersPickerView.swift
//  Sluff Scorecard
//
//  Created by Chad Wallace on 1/31/24.
//

import SwiftUI

struct NumPlayersPickerView: View {
    
    @Bindable var appState: AppState
    
    var body: some View {
        VStack{
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
