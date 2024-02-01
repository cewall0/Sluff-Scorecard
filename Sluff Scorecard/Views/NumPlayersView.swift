//
//  NumPlayersView.swift
//  Sluff Scorecard
//
//  Created by Chad Wallace on 1/30/24.
//

//
//  AddPlayerView.swift
//  Sluff Scorecard
//
//  Created by Chad Wallace on 1/30/24.
//

import SwiftUI
import Observation


struct NumPlayersView: View {
    
//    @Bindable private var viewModel = GameViewModel()
    @Environment(AppState.self) private var appState
//    @State var numberOfPlayers = 0
    
    var body: some View {
        NavigationView {
        
            VStack{
//                Form{
                    VStack{
                        Text("First things first. . .")
                            .font(.title)
                        Text(" ")
                        Text("How many players will be playing?")
                            .font(.title3)
                        Text(" ")
                        Text(" ")
                        
                        NumPlayersPickerView(appState: appState)
                        .pickerStyle(.segmented)
                        .onChange(of: appState.numberOfPlayers) {appState.setNumberOfPlayers(appState.numberOfPlayers)}
                        
                        NavigationLink("Let's Go") {
                            AddPlayerView()
                        }
                        .padding()
                        .foregroundColor(.white)
                        .background(appState.numPlayersIsSelected ? .blue.opacity(1.0) : .blue.opacity(0.4))
                        .clipShape(Capsule())
                        .padding()
                        .disabled(!appState.numPlayersIsSelected)
                        
                    }
                    
                    Spacer()
                    
                } // end VStack
            } // end Navigation View
//        } // end form
    }
}

#Preview {
    NumPlayersView()
        .environment(AppState())
}
