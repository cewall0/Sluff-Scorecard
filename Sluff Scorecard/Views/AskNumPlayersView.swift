//
//  AskNumPlayersView.swift
//  Sluff Scorecard
//
//  Created by Chad Wallace on 2/17/24.
//

import SwiftUI

struct AskNumPlayersView: View {
    
    @Environment(Game.self) private var game
    @EnvironmentObject var router: Router
    
    @Environment(\.verticalSizeClass) var heightSizeClass: UserInterfaceSizeClass?
    @Environment(\.horizontalSizeClass) var widthSizeClass: UserInterfaceSizeClass?
    
    init() {
        
        //This will change the font size
        UISegmentedControl.appearance().setTitleTextAttributes([.font : UIFont.preferredFont(forTextStyle: .headline)], for: .highlighted)
        UISegmentedControl.appearance().setTitleTextAttributes([.font : UIFont.preferredFont(forTextStyle: .title2)], for: .normal)
        
    }
    
    
    var body: some View {
        
        @Bindable var game = game
        
        NavigationStack(path: $router.path) {
            
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
                    router.reset()
                    router.path.append(1)
                }, label: {
                    Text("Let's play")
                })
                .padding(.top, 20.0)
                .font(widthSizeClass == .regular ? .title : .title2)
                .buttonStyle(.borderedProminent)
                .tint(.accentColor)
            }
            .navigationDestination(for: Int.self) { destination in
                switch destination {
                case 1:
                    ScorecardView().environmentObject(router)
                case 2:
                    ScoreHandView().environmentObject(router)
                case 3:
                    SettingsView().environmentObject(router)
                case 4:
                    WinnerView().environmentObject(router)
                case 5:
                    HistoryView().environmentObject(router)
                default:
                    EmptyView()
                    
                    Spacer()
                }
            }
            Spacer()
        }
    }
}

#Preview {
    AskNumPlayersView()
        .environment(Game())
        .environmentObject(Router())
        .previewDevice("iPhone 15 Pro")
    
}
