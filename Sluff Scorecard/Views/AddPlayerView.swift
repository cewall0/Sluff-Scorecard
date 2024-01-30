//
//  AddPlayerView.swift
//  Sluff Scorecard
//
//  Created by Chad Wallace on 1/30/24.
//

import SwiftUI
import Observation


struct AddPlayerView: View {
    
    @Bindable private var viewModel = GameViewModel()
    
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
                        
                        List(viewModel.playersList) { player in
                            Text(player.name)
                        }
//                        ForEach($viewModel.playersList) { $player in
//                            TextField("Hint", text: $player.name)
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
}
