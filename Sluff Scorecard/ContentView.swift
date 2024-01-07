//
//  ContentView.swift
//  Sluff Scorecard
//
//  Created by Chad Wallace on 1/1/24.
//

import Foundation
import SwiftUI
import Observation

struct ContentView: View {//Masons Comment
    
    @State private var viewState = ViewState()
    @Environment(AppState.self) var appState
    
    var body: some View {
        VStack {
            Button("DetailView"){
                viewState.isDetailViewPresented.toggle()
            }
            Text(appState.person.name)
            Button("Fetch"){
                appState.fetchPerson()
            }
            .padding()
            .sheet(isPresented: $viewState.isDetailViewPresented) {
                DetailView()
            }
            Text("Number of Players: \(appState.game.numPlayers)").foregroundColor(.black)
            
        }
    }
}

#Preview {
    ContentView()
        .environment(AppState())
}

@Observable
fileprivate class ViewState{
    var isDetailViewPresented: Bool
    
    init(isDetailViewPresented: Bool = false) {
        self.isDetailViewPresented = isDetailViewPresented
    }
}
