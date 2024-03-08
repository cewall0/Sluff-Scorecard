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
        
        GeometryReader{ geometry in
            
            NavigationStack(path: $router.path) {
                
                VStack{
                    Text("")
                    Text("")
                    Image("color sluff scorecard")
                        .resizable()
                        .frame(width: geometry.size.height * 0.3, height: geometry.size.height * 0.12)
                    Text("")
                    Text("")
                    Text("Welcome!").font(geometry.size.width > 700 ? .system(size: geometry.size.height * 0.04) : .system(size: geometry.size.height * 0.03))
                    Text("")
                    Text("How many players will be playing?").font(geometry.size.width > 700 ? .system(size: geometry.size.height * 0.03) : .system(size: geometry.size.height * 0.02))
                    Picker("", selection: $game.numberOfPlayers) {
                        Text("6").tag(6)
                            .font(geometry.size.width > 700 ? .system(size: geometry.size.height * 0.02) : .system(size: geometry.size.height * 0.015))
                        Text("8").tag(8)
                            .font(geometry.size.width > 700 ? .system(size: geometry.size.height * 0.02) : .system(size: geometry.size.height * 0.015))
                        Text("10").tag(10)
                            .font(geometry.size.width > 700 ? .system(size: geometry.size.height * 0.02) : .system(size: geometry.size.height * 0.015))
                    }
//                    .font(geometry.size.width > 700 ? .system(size: geometry.size.height * 0.04) : .system(size: geometry.size.height * 0.025))
                    .pickerStyle(.segmented)
//                    .padding(.top, -50.0)
                    
                    
                    
                    Button(action: {
                        game.setNumberOfPlayers()
                        router.reset()
                        router.path.append(1)
                    }, label: {
                        Text("Let's play")
                    })
                    .font(geometry.size.width > 700 ? .system(size: geometry.size.height * 0.02) : .system(size: geometry.size.height * 0.015))
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
}

#Preview {
    AskNumPlayersView()
        .environment(Game())
        .environmentObject(Router())
}
