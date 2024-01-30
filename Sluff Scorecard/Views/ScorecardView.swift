////
////  ScorecardView.swift
////  Sluff Scorecard
////
////  Created by Chad Wallace on 1/1/24.
////
//
import Foundation
import SwiftUI
import Observation

struct ScorecardView: View {
    
//    @State private var viewState = ViewState()  // viewState is only needed in this view, so it is an @State property. But, it needs to be able to be updated and held as a state variable for this view.
    
    
//    @Bindable var game = Game() // this allows this view to bind to the Game class so its properties can be changed.
//
//    @Bindable var player1 = Player(name: "Player1", playerPosition: 1)
//    @Bindable var player2 = Player(name: "Player2", playerPosition: 2)
//    @Bindable var player3 = Player(name: "Player3", playerPosition: 3)
//    @Bindable var player4 = Player(name: "Player4", playerPosition: 4)
//    @Bindable var player5 = Player(name: "Player5", playerPosition: 5)
//    @Bindable var player6 = Player(name: "Player6", playerPosition: 6)
//    @Bindable var player7 = Player(name: "Player7", playerPosition: 7)
//    @Bindable var player8 = Player(name: "Player8", playerPosition: 8)
//    @Bindable var player9 = Player(name: "Player9", playerPosition: 9)
//    @Bindable var player10 = Player(name: "Player10", playerPosition: 10)
    
    var body: some View {
        VStack {
            
            Text("Scorecard")
                .font(.system(size: 32))
                .bold()
                .padding(.top, 10)
//            Button("DetailView"){
//                viewState.isDetailViewPresented.toggle()
//            }
//            .padding()
//            .sheet(isPresented: $viewState.isDetailViewPresented) { // $ becasue this viewState is a binding to the viewState state variable. It needs to be able to be changed.
//                
//                DetailView()
//            }
           

//            Text("Player #: \(player1.playerPosition) is \(player1.name)")
//            
//            Text("Player: \(player2.playerPosition) is \(player2.name)")
//            
//           TextField("Player1 name", text: ($player1.name))
//
            

            
        }
    }
}

#Preview {
    ScorecardView()
}

//@Observable
//fileprivate class ViewState{
//    var isDetailViewPresented: Bool
//    
//    init(isDetailViewPresented: Bool = false) {
//        self.isDetailViewPresented = isDetailViewPresented
//    }
//}
//
