//
//  Sluff_ScorecardApp.swift
//  Sluff Scorecard
//
//  Created by Chad Wallace on 1/1/24.
//


import SwiftUI
import AppTrackingTransparency
import GoogleMobileAds

@main
struct Sluff_ScorecardApp: App {
    
    @State private var game = Game()
    
    // Use init() instead of applicationDidFinishLaunchingWithOptions
    
    init() {
        // Delay the tracking request to ensure it happens after app launch
         DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
        if ATTrackingManager.trackingAuthorizationStatus == .notDetermined {
            ATTrackingManager.requestTrackingAuthorization { status in
                       // Initialize Google Mobile Ads regardless of the user's choice
                       GADMobileAds.sharedInstance().start(completionHandler: nil)
                   }
            // The user has not made a choice yet regarding app tracking.
            // This is a good place to show a custom explainer screen or dialog.
            // Toggle any variables or state here if you want to handle this.
        } else {
            // Request the tracking authorization and initialize GADMobileAds
            ATTrackingManager.requestTrackingAuthorization { status in
                // Initialize Google Mobile Ads regardless of the user's choice
                GADMobileAds.sharedInstance().start(completionHandler: nil)
            }}
        }
    }

    var body: some Scene {
        WindowGroup {
                SplashScreenView()
                .environment(game)
        }
    }
}
