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
    
    var body: some View {
        @Bindable var game = game
        
        NavigationStack(path: $router.path) {
            
            VStack{
                Text("")
                Text("")
                Image("color sluff scorecard")
                    .resizable()
                    .frame(width: 240, height: 96)
                Text("")
                Text("")
                Text("Welcome!").font(.title)
                Text("")
                Text("How many players will be playing?").font(.title3)
                Picker("", selection: $game.numberOfPlayers) {
                    Text("6").tag(6)
                    Text("8").tag(8)
                    Text("10").tag(10)
                }
                .pickerStyle(.wheel)
                .padding(.top, -50.0)
                
                
                Button(action: {
                    game.setNumberOfPlayers()
                    router.reset()
                    router.path.append(1)
                }, label: {
                    Text("Let's play")
                }).buttonStyle(.borderedProminent)
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
}
