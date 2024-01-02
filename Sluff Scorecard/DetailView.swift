//
//  DetailView.swift
//  Sluff Scorecard
//
//  Created by Chad Wallace on 1/1/24.
//

import Foundation
import SwiftUI
import SwiftData

struct DetailView: View {
    
    @Environment(AppState.self) var appState
    
    var body: some View {
        Text("Hello, DetailView!")
    }
}

#Preview {
    DetailView()
        .environment(AppState())
}
