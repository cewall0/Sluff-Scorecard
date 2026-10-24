//
//  InterstitialAdManager.swift
//  Sluff Scorecard
//

import SwiftUI
import GoogleMobileAds
import UIKit

/// Preloads one interstitial and shows it at natural breaks (e.g. game over).
/// Never blocks the user: if no ad is ready, `showIfReady` just calls `onFinish`.
@MainActor
final class InterstitialAdManager {

    static let shared = InterstitialAdManager()

    /// Minimum time between interstitials.
    private let minimumInterval: TimeInterval = 180

    private var interstitial: GADInterstitialAd?
    private var isLoading = false
    private var isShowingAd = false
    private var lastShown: Date?
    private var adDelegate: InterstitialAdDelegate?

    private init() {}

    func loadAd() {
        guard interstitial == nil, !isLoading else { return }
        isLoading = true

        GADInterstitialAd.load(
            withAdUnitID: AdUnit.homeInterstitial.unitID,
            request: GADRequest()
        ) { [weak self] ad, error in
            Task { @MainActor in
                guard let self else { return }
                self.isLoading = false
                if let error {
                    print("Interstitial failed to load:", error.localizedDescription)
                    return
                }
                self.interstitial = ad
                print("Interstitial loaded ✅")
            }
        }
    }

    func showIfReady(onFinish: @escaping () -> Void) {
        @AppStorage("isPurchased") var isPurchased = false

        if let lastShown, Date().timeIntervalSince(lastShown) < minimumInterval {
            onFinish()
            return
        }

        guard !isPurchased,
              !isShowingAd,
              let interstitial,
              let rootVC = topViewController()
        else {
            loadAd()
            onFinish()
            return
        }

        isShowingAd = true

        adDelegate = InterstitialAdDelegate { [weak self] in
            guard let self else { return }
            self.isShowingAd = false
            self.interstitial = nil
            self.adDelegate = nil
            self.lastShown = Date()
            self.loadAd()
            onFinish()
        }

        interstitial.fullScreenContentDelegate = adDelegate
        interstitial.present(fromRootViewController: rootVC)
    }

    private func topViewController() -> UIViewController? {
        var top = UIApplication.shared
            .connectedScenes
            .compactMap({ $0 as? UIWindowScene })
            .flatMap({ $0.windows })
            .first(where: { $0.isKeyWindow })?
            .rootViewController
        while let presented = top?.presentedViewController {
            top = presented
        }
        return top
    }
}

// MARK: - Full Screen Ad Delegate

final class InterstitialAdDelegate: NSObject, GADFullScreenContentDelegate {

    private let onDismiss: () -> Void

    init(onDismiss: @escaping () -> Void) {
        self.onDismiss = onDismiss
    }

    func adDidDismissFullScreenContent(_ ad: GADFullScreenPresentingAd) {
        onDismiss()
    }

    func adDidFailToPresentFullScreenContent(
        _ ad: GADFullScreenPresentingAd,
        withError error: Error
    ) {
        print("Ad failed to present:", error.localizedDescription)
        onDismiss()
    }
}
