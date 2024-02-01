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
    
    @Environment(AppState.self) private var appState
    
    var body: some View {
        VStack {
            
            Text("Scorecard")
                .font(.system(size: 32))
                .bold()
                .padding(.top, 10)
            
            List(appState.playersList) { player in
                Text(player.name)
            }
            
            
            
            
            
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
        .environment(AppState())
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
