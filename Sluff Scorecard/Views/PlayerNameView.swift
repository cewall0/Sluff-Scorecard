//
//  PlayerNameView.swift
//  Sluff Scorecard
//
//  Created by Chad Wallace on 2/3/24.
//

import SwiftUI

struct PlayerNameView: View {
    
    @Bindable var appState: AppState
    
    var body: some View {
        TextField("Enter name", text: $appState.playersList[0].name)
            .textFieldStyle(PlainTextFieldStyle())
            .accentColor(.pink)
            .foregroundColor(.blue)
            .padding(4)
            .background(.teal.opacity(0.3))
            .cornerRadius(8)
    }
}

#Preview {
    PlayerNameView(appState: AppState())
}
