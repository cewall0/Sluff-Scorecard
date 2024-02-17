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
            Text("")
            Text("")
            Text("Sluff Scorecard")
                .font(.system(size: 32))
                .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                .bold()
                .padding(.top, 10)
            Text("(Settings)")
                .font(.system(size: 26))
                .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                .bold()
            Text(" ")
            Text(" ")
            
            VStack(alignment: .leading){
                
                HStack{
                    Text("• ").foregroundColor(.black)
                    Text("You can edit the team and player names by tapping on them.").foregroundColor(.black)
                    Spacer()
                } // end HStack
                
                Text(" ")
                
                HStack{
                    Text("• ").foregroundColor(.black)
                    Text("D").foregroundColor(.yellow)
                    Text("indicates the current dealer.").foregroundColor(.black)
                    Spacer()
                } // end HStack
                
                Text(" ")
                
                HStack{
                    Text("• ").foregroundColor(.black)
                    Link("Rules of Sluff (gamesrules.com)", destination: URL(string: "https://gamerules.com/rules/rook-sluff-card-game/")!)
                    Spacer()
                }
                
                
                Text(" ")
                
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
                
                HStack{
                    Spacer()
                    Button(action: {
                        router.reset()
                        router.path.append(1)
                    }) {
                        Text("Return")
                    }.buttonStyle(.borderedProminent) // end button
                    Spacer()
                }
            } // end VStack
            .padding(.horizontal)
        } // end VStack
    } // end View body
} // end struct

#Preview {
    SettingsView()
        .environment(Game())
        .environmentObject(Router())
}
