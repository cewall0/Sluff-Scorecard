//
//  AskNumPlayersView.swift
//  Sluff Scorecard
//
//  Created by Chad Wallace on 2/17/24.
//

import Foundation
import SwiftUI
import Observation


struct AskNumPlayersView: View {
    
    @Environment(Game.self) private var game
    
    @Environment(\.verticalSizeClass) var heightSizeClass: UserInterfaceSizeClass?
    @Environment(\.horizontalSizeClass) var widthSizeClass: UserInterfaceSizeClass?
    
    @State var path = NavigationPath()
    
    func reset() {
        self.path = NavigationPath()
    }
    
    
    init() {
        
        //This will change the font size
        UISegmentedControl.appearance().setTitleTextAttributes([.font : UIFont.preferredFont(forTextStyle: .headline)], for: .highlighted)
        UISegmentedControl.appearance().setTitleTextAttributes([.font : UIFont.preferredFont(forTextStyle: .title2)], for: .normal)
        
    }
    
    
    var body: some View {
        
        @Bindable var game = game
        
        NavigationStack(path: $path) {
            
            VStack{
                Text("")
                Text("")
                Image("SluffScorecardTitleSVG")
                    .resizable()
                    .frame(width: 250, height: 140)
                Text("")
                Text("")
                Text("Welcome!").font(widthSizeClass == .regular ? .largeTitle : .title)
                Text("")
                Text("How many players will be playing?").font(widthSizeClass == .regular ? .title : .title2)
                
                Picker("", selection: $game.numberOfPlayers) {
                    Text("6").tag(6)
                    
                    Text("8").tag(8)
                    
                    Text("10").tag(10)
                    
                }
                .pickerStyle(.segmented)
                .padding()
                
                
                Button(action: {
                    game.setNumberOfPlayers()
                    reset()
                    path.append(1)
                }, label: {
                    Text("Let's play")
                })
                .padding(.top, 20.0)
                .font(widthSizeClass == .regular ? .title : .title2)
                .buttonStyle(.borderedProminent)
                .tint(.accentColor)
                
                Spacer()
                
            }
            .navigationDestination(for: Int.self) { destination in
                switch destination {
                case 1:
                    ScorecardView(path: $path)
                case 2:
                    ScoreHandView(path: $path)
                case 3:
                    SettingsView(path: $path)
                case 4:
                    WinnerView(path: $path)
                case 5:
                    HistoryView(path: $path)
                default:
                    EmptyView()
                }
            }
        }
    }
}

#Preview {
    NavigationStack{
        AskNumPlayersView()
            .environment(Game())
    }
}
