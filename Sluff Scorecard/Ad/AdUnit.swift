//
//  AdUnit.swift
//
//  Created by Chad Wallace on 9/20/24.
//

import SwiftUI
import AdSupport
import AppTrackingTransparency
import Foundation
import GoogleMobileAds

enum AdUnit {
    case homeRewarded
    case homeInterstitial
    case homeBanner
    case homeOpenAd
    // You should return your ad unit IDs here
    var unitID: String {
        switch self {
            #if DEBUG
            // Admob Test ID
        case .homeRewarded: return "ca-app-pub-3940256099942544/1712485313"
        case .homeInterstitial: return "ca-app-pub-3940256099942544/4411468910"
        case .homeBanner: return "ca-app-pub-3940256099942544/2934735716"
        case .homeOpenAd: return "ca-app-pub-3940256099942544/5575463023"
            #else
        // Admob ID
        case .homeRewarded: return rewardedID
        case .homeInterstitial: return interstitialID
        case .homeBanner: return bannerID
        case .homeOpenAd: return openAdID
            #endif
        }
    }
}

//Admob Release ID
let bannerID = "ca-app-pub-5511806561009019/9452121329" //ok
let interstitialID = "ca-app-pub-5511806561009019/7451771809" //ok
let rewardedID = "" //ok
let openAdID = "" //ok
