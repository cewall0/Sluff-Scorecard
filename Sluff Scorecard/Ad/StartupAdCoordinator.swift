//
//  StartupAdCoordinator.swift
//  Sluff Scorecard
//

import Foundation

@MainActor
final class StartupAdCoordinator {

    static let shared = StartupAdCoordinator()

    var manager: StartupAdManager?
    private var hasPresentedAd = false

    /// Shows the startup interstitial once per app launch
    func presentIfNeeded(onDismiss: @escaping () -> Void) {
        guard !hasPresentedAd else {
            onDismiss()
            return
        }

        hasPresentedAd = true

        guard let manager else {
            onDismiss()
            return
        }

        manager.showAdIfReady {
            onDismiss()
        }
    }

    /// Useful for testing or debugging
    func reset() {
        hasPresentedAd = false
    }
}

