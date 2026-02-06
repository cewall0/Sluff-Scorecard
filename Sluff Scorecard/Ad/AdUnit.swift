//
//  AdUnit.swift
//

import Foundation
import GoogleMobileAds

enum AdUnit {
    case homeInterstitial
    case homeBanner
    case homeRewarded
    case homeOpenAd

    var unitID: String {
        #if DEBUG
        switch self {
        case .homeInterstitial: return "ca-app-pub-3940256099942544/4411468910"
        case .homeBanner: return "ca-app-pub-3940256099942544/2934735716"
        case .homeRewarded: return "ca-app-pub-3940256099942544/1712485313"
        case .homeOpenAd: return "ca-app-pub-3940256099942544/5575463023"
        }
        #else
        switch self {
        case .homeInterstitial: return interstitialID
        case .homeBanner: return bannerID
        case .homeRewarded: return rewardedID
        case .homeOpenAd: return openAdID
        }
        #endif
    }
}

// Release IDs
let bannerID = "ca-app-pub-5511806561009019/9452121329"
let interstitialID = "ca-app-pub-5511806561009019/7451771809"
let rewardedID = ""
let openAdID = ""
