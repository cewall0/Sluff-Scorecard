//
//  AdSettings.swift
//

import SwiftUI
import AppTrackingTransparency
import AdSupport

func requestPermission() {
    @AppStorage("isPurchased") var isPurchased = false
    @AppStorage("requestAds") var requestAds = false

    if !isPurchased {
        if #available(iOS 14, *) {
            ATTrackingManager.requestTrackingAuthorization { status in
                switch status {
                case .authorized:
                    requestAds = true
                    print("Authorized, IDFA:", ASIdentifierManager.shared().advertisingIdentifier)
                case .denied, .restricted, .notDetermined:
                    requestAds = true
                    print("Not authorized")
                @unknown default: break
                }
            }
        }
    }
}
