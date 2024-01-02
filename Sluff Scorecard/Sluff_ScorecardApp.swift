//
//  Sluff_ScorecardApp.swift
//  Sluff Scorecard
//
//  Created by Chad Wallace on 1/1/24.
//


import SwiftUI

@main
struct Sluff_ScorecardApp: App {
    
    @State private var appState = AppState()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(appState)
        }
    }
}
