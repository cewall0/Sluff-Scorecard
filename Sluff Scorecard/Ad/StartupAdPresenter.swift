//
//  StartupAdPresenter.swift
//

import SwiftUI
import UIKit

struct StartupAdPresenter: UIViewControllerRepresentable {
    let adManager: StartupAdManager
    let onDismiss: () -> Void

    func makeUIViewController(context: Context) -> UIViewController {
        let vc = UIViewController()

        DispatchQueue.main.async {
            StartupAdCoordinator.shared.manager = adManager
            StartupAdCoordinator.shared.presentIfNeeded(from: vc) {
                onDismiss()
            }
        }

        return vc
    }

    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}
}

