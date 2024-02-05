//
//  AddPlayerView.swift
//  Sluff Scorecard
//
//  Created by Chad Wallace on 1/30/24.
//

import SwiftUI
import Observation


struct AddPlayerView: View {
    
    @Environment(Game.self) private var game

    var body: some View {
        
            
                    VStack{
                        Text("Setup Players")
                            .font(.title)
                        Text(" ")
                        Text("Add player names.").font(.title3)
                        Text("")
                        VStack(alignment: .leading, spacing: 4){
                            
                            Text("• Position 1 is the first dealer.").font(.headline).fontWeight(.medium)
                            Text("• Position 2 is the next player going around the table clockwise. ")
                                .font(.headline)
                                .fontWeight(.medium)
                            Text("• Continue until all player names are entered. ")
                                .font(.headline)
                                .fontWeight(.medium)

                        }
                        
                        
                        EditablePlayerListView(game: game)
                        
                        NavigationLink("Go to Sluff Scorecard") {
                            ScorecardView()
                        }
                        .padding()
                        .foregroundColor(.white)
                        .background(.blue)
                        .clipShape(Capsule())
                        .padding()
                        
                        Spacer()
                        
                    } // end VStack
                    .padding()

    }
}

#Preview {
    AddPlayerView()
        .environment(Game())
}
