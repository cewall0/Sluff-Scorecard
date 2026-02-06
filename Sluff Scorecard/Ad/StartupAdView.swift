//
//  StartupAdView.swift
//

import SwiftUI

struct StartupAdView: View {
    let continueAction: () -> Void
    @State private var showFooter = false

    var body: some View {
        ZStack {
            Color.clear.ignoresSafeArea() // transparent overlay

            VStack {
                Spacer()
                if showFooter {
                    HStack {
                        Text("Continue to Sluff Scorecard")
                            .foregroundColor(.white)
                            .font(.headline)
                        Spacer()
                        Button(action: continueAction) {
                            Image(systemName: "arrow.forward.circle.fill")
                                .font(.system(size: 42))
                                .foregroundColor(.white)
                        }
                    }
                    .padding()
                    .background(Color.black.opacity(0.6))
                    .transition(.move(edge: .bottom).combined(with: .opacity))
                }
            }
        }
        .allowsHitTesting(true)
        .onAppear {
            withAnimation(.easeIn(duration: 0.5).delay(0.5)) {
                showFooter = true
            }
        }
    }
}

