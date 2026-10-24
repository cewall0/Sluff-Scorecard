//
//  AdSettings.swift
//

import SwiftUI
import AppTrackingTransparency
import GoogleMobileAds

private var adsStarted = false

/// Asks for tracking permission (once), then starts the Google Mobile Ads SDK
/// and preloads the interstitial. Call when the first screen appears.
@MainActor
func startAds() {
    @AppStorage("isPurchased") var isPurchased = false

    guard !adsStarted, !isPurchased else { return }

    // iOS silently skips the ATT prompt unless the app is active, so wait for it
    guard UIApplication.shared.applicationState == .active else {
        var observer: NSObjectProtocol?
        observer = NotificationCenter.default.addObserver(
            forName: UIApplication.didBecomeActiveNotification, object: nil, queue: .main
        ) { _ in
            if let observer { NotificationCenter.default.removeObserver(observer) }
            Task { @MainActor in startAds() }
        }
        return
    }
    adsStarted = true

    ATTrackingManager.requestTrackingAuthorization { _ in
        // Start ads regardless of the user's choice
        GADMobileAds.sharedInstance().start { _ in
            Task { @MainActor in
                InterstitialAdManager.shared.loadAd()
            }
        }
    }
}
