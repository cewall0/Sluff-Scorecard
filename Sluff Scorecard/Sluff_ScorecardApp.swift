//
//  Sluff_ScorecardApp.swift
//  Sluff Scorecard
//
//  Created by Chad Wallace on 1/1/24.
//


import SwiftUI
import WallaceAds

@main
struct Sluff_ScorecardApp: App {
    
    @State private var game = Game.loadSaved() ?? Game()
    @Environment(\.scenePhase) private var scenePhase

    init() {
        #if DEBUG
        let useTestAds = true
        #else
        let useTestAds = false
        #endif
        WallaceAds.configure(.init(
            bannerID: "ca-app-pub-5511806561009019/9452121329",
            interstitialID: "ca-app-pub-5511806561009019/7451771809",
            useTestAds: useTestAds
        ))
    }

    var body: some Scene {
        WindowGroup {
                SplashScreenView()
                .environment(game)
                .onChange(of: scenePhase) { _, phase in
                    if phase != .active { game.save() } // keep the game if iOS closes the app
                }
                .onAppear { UIApplication.shared.isIdleTimerDisabled = true } // keep the screen awake during play
        }
    }
}
