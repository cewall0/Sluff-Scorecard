//
//  SettingsView.swift
//  Sluff Scorecard
//
//  Created by Chad Wallace on 1/30/24.
//

import Foundation
import SwiftUI
import Observation


struct SettingsView: View {
    
    @Environment(Game.self) private var game
    @EnvironmentObject var router: Router
    
    @Binding var path: NavigationPath
    
    func reset() {
        self.path = NavigationPath()
    }

    
    @Environment(\.verticalSizeClass) var heightSizeClass: UserInterfaceSizeClass?
    @Environment(\.horizontalSizeClass) var widthSizeClass: UserInterfaceSizeClass?
    
    
    var body: some View {
        @Bindable var game = game
        VStack{
            Text(" ")

            Image("SluffScorecardTitleSVG")
                .resizable()
                .frame(width: 250, height: 140)


            ScrollView{
                
                VStack(alignment: .leading){
                    
                    HStack(alignment: .top){
                        Text("• ").foregroundColor(.black)
                        Text("You can edit the team and player names by tapping on them.")
                            .foregroundColor(.black)
                            .multilineTextAlignment(.leading)
                        Spacer()
                    } // end HStack
                    
                    Divider()
                    
                    HStack(alignment: .top){
                        Text("• ").foregroundColor(.black)
                        Text("D").foregroundColor(.yellow)
                        Text("indicates the current dealer.").foregroundColor(.black)
                            .multilineTextAlignment(.leading)
                        Spacer()
                    } // end HStack
                    
                    Divider()
                    
                    HStack(alignment: .top){
                        Text("• ")
                        Link("Read the rules of Sluff at gamerules.com", destination: URL(string: "https://gamerules.com/rules/rook-sluff-card-game/")!)
                        Spacer()
                    }
                    .foregroundColor(.black)
                    .multilineTextAlignment(.leading)
                    
                    
                    Divider()
                    
                    HStack(alignment: .top){
                        Text("• ").foregroundColor(.black)
                        Button {
                            game.resetGame()
                            reset()
                        } label: {
                            Text("Change the number of players")
                                .multilineTextAlignment(.leading)
                                .foregroundColor(.black)
                        }
                    }
                    
                    
                    Spacer()
                    

                } // end VStack
                .font(widthSizeClass == .regular ? .title : .title2)
                .padding(.horizontal)
                
            }
        } // end VStack
    } // end View body
} // end struct

#Preview {
    SettingsView(path: Binding.constant(NavigationPath()))
        .environment(Game())

}
