//
//  SettingsView.swift
//  Sluff Scorecard
//
//  Created by Chad Wallace on 1/30/24.
//

import SwiftUI
import Observation

struct SettingsView: View {
    
    @Environment(Game.self) private var game
    @EnvironmentObject var router: Router
    
    
    var body: some View {
        @Bindable var game = game
        VStack{
            Text(" ")

            Image("color sluff scorecard")
                .resizable()
                .frame(width: 200, height: 80)

            Text(" ")

            
            ScrollView{
                
                VStack(alignment: .leading){
                    
                    HStack{
                        Text("• ").foregroundColor(.black)
                        Text("You can edit the team and player names by tapping on them.").foregroundColor(.black)
                        Spacer()
                    } // end HStack
                    
//                    Text(" ")
                    Divider()
                    
                    HStack{
                        Text("• ").foregroundColor(.black)
                        Text("D").foregroundColor(.yellow)
                        Text("indicates the current dealer.").foregroundColor(.black)
                        Spacer()
                    } // end HStack
                    
//                    Text(" ")
                    Divider()
                    
                    HStack{
                        Text("• ")
                        Link("Read the rules of Sluff at gamerules.com", destination: URL(string: "https://gamerules.com/rules/rook-sluff-card-game/")!)
                        Spacer()
                    }
                    
                    
//                    Text(" ")
                    Divider()
                    
                    HStack{
                        Text("• ").foregroundColor(.black)
                        Button {
                            game.resetGame()
                            router.reset()
                        } label: {
                            Text("Change the number of players")
                        }
                    }
                    
                    
                    Spacer()
                    
//                    HStack{
//                        Spacer()
//                        Button(action: {
//                            router.reset()
//                            router.path.append(1)
//                        }) {
//                            Text("Return")
//                        }.buttonStyle(.borderedProminent)
//                            .tint(.accentColor)
//                            .padding()
//                        Spacer()
//                    }
                } // end VStack
                .padding(.horizontal)
                
            }
        } // end VStack
    } // end View body
} // end struct

#Preview {
    SettingsView()
        .environment(Game())
        .environmentObject(Router())
}
