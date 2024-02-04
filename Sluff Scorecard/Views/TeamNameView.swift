//
//  TeamNameView.swift
//  Sluff Scorecard
//
//  Created by Chad Wallace on 2/3/24.
//

import SwiftUI


struct TeamNameView: View {
    
    @Bindable var appState: AppState
    
    let twoColumnGrid = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        
        VStack{
            
            LazyVGrid(columns: twoColumnGrid, alignment: .center, spacing: 10) {
                TextField(appState.team1Name, text: $appState.team1Name).multilineTextAlignment(.center)
                TextField(appState.team2Name, text: $appState.team2Name).multilineTextAlignment(.center)
                
            }.font(.title) // end LazyVGrid
            
            
          
            
        }
    }
}

#Preview {
    TeamNameView(appState: AppState())
}
