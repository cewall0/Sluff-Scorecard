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
    
    @Bindable private var viewModel = GameViewModel()
    
    var body: some View {
        NavigationView {
            
            
            VStack{
                Form{
                    VStack{
                        Text("First things first. . .")
                            .font(.title)
                        Text(" ")
                        Text("How many players will be playing?")
                            .font(.title3)
                        Text(" ")
                        Text(" ")
                        
                        Picker("Number of Players", selection: $viewModel.numberOfPlayers) {
                            Text("6")
                                .tag(6)
                            
                            Text("8")
                                .tag(8)
                            
                            Text("10")
                                .tag(10)
                            
                        }
                        .pickerStyle(.segmented)
                        .onChange(of: viewModel.numberOfPlayers) {viewModel.setNumberOfPlayers(viewModel.numberOfPlayers)}
                        
                        NavigationLink("Let's Go") {
                            AddPlayerView()
                        }
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.gray)
                        .clipShape(Capsule())
                        .padding()
                        
                    }
                    
                    
                    Spacer()
                    
                    
                } // end VStack
            } // end Navigation View
        }
    }
}

#Preview {
    NumPlayersView()
}
