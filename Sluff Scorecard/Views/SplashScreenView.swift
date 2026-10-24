//
//  SplashScreenView.swift
//  Sluff Scorecard
//

import SwiftUI

struct SplashScreenView: View {

    // MARK: - Splash animation
    @State private var isActive = false
    @State private var size: CGFloat = 0.05
    @State private var opacity: Double = 0.4

    // MARK: - Navigation control
    @State private var showPlayersView = false
    @State private var isTransitioningToGame = false   // ✅ NEW FLAG

    var body: some View {
        ZStack {

            // MARK: - WallaceWay Splashscreen
            if !isActive {
                VStack {
                    Spacer()

                    Image("WallaceWay")
                        .resizable()
                        .frame(width: 1586, height: 492)
                        .cornerRadius(15.0)
                        .scaleEffect(size)
                        .opacity(opacity)
                        .onAppear {
                            withAnimation(.easeIn(duration: 3.0)) {
                                size = 0.2
                                opacity = 1.0
                            }
                        }

                    Spacer()
                }
            }

            // MARK: - Title Page (only if NOT transitioning)
            if isActive && !isTransitioningToGame {
                VStack {
                    Spacer()

                    Image("SluffScorecardTitleSVG")
                        .resizable()
                        .frame(width: 250, height: 140)
                        .padding()


                    Button("Let’s Go") {
                        // 🔒 Lock UI immediately
                        isTransitioningToGame = true
                        showPlayersView = true
                    }
                    .padding()
                    .buttonStyle(.borderedProminent)
                    .tint(.accentColor)

                    Button("Remove Ads Option (Coming Soon)") {
                                          // Stub for future IAP
                                      }
                                      .font(.footnote)
                                      .foregroundColor(.secondary)

                    
                    Spacer()
                }
            }
        }
        // ✅ Present AskNumPlayersView directly
        .fullScreenCover(isPresented: $showPlayersView) {
            AskNumPlayersView()
        }
        .onAppear {
            startAds() // ATT permission, then start ads and preload interstitial

            DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                withAnimation {
                    isActive = true
                }
            }
        }
    }
}

