//
//  StartupAdManager.swift
//  Sluff Scorecard
//

//
//  StartupAdManager.swift
//  Sluff Scorecard
//

import SwiftUI
import GoogleMobileAds
import UIKit

@MainActor
final class StartupAdManager: ObservableObject {

    @Published var isAdReady = false

    private var interstitial: GADInterstitialAd?
    private var isShowingAd = false
    private var adDelegate: StartupAdDelegate?

    init() {
        loadAd()
    }

    func loadAd() {
        isAdReady = false

        let request = GADRequest()
        GADInterstitialAd.load(
            withAdUnitID: AdUnit.homeInterstitial.unitID,
            request: request
        ) { [weak self] ad, error in
            if let error {
                print("Interstitial failed to load:", error.localizedDescription)
                return
            }

            self?.interstitial = ad
            self?.isAdReady = true
            print("Interstitial loaded ✅")
        }
    }

    func showAdIfReady(onFinish: @escaping () -> Void) {
        guard let rootVC = UIApplication.shared
            .connectedScenes
            .compactMap({ $0 as? UIWindowScene })
            .flatMap({ $0.windows })
            .first(where: { $0.isKeyWindow })?
            .rootViewController
        else {
            onFinish()
            return
        }

        guard let interstitial, !isShowingAd else {
            print("Interstitial not ready, skipping ad")
            onFinish()
            return
        }

        isShowingAd = true

        adDelegate = StartupAdDelegate { [weak self] in
            self?.isShowingAd = false
            self?.interstitial = nil
            self?.adDelegate = nil
            self?.loadAd()
            onFinish()
        }

        interstitial.fullScreenContentDelegate = adDelegate
        interstitial.present(fromRootViewController: rootVC)
    }
}

// MARK: - Full Screen Ad Delegate

final class StartupAdDelegate: NSObject, GADFullScreenContentDelegate {

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
