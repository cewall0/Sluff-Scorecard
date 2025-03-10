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
                        Text("• ").foregroundColor(.black)
                        Button {
                            reset()
                            path.append(7)
                        } label: {
                            Text("Click here to read the rules of the game.")
                                .multilineTextAlignment(.leading)
                                .foregroundColor(.black)
                        }
                    }
                    
                    Divider()
                    
                    HStack(alignment: .top){
                        Text("• ")
                        Link("Click here to learn how to use this app.", destination: URL(string: "https://sites.google.com/view/sluff-scorecard/")!)
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
                            Text("Click here to change the number of players and reset game.")
                                .multilineTextAlignment(.leading)
                                .foregroundColor(.black)
                        }
                    }
                    
                    
                    
                    
                    Spacer()
                    

                } // end VStack
                .font(widthSizeClass == .regular ? .title2 : .title3)
                .padding(.horizontal)
                
            }
        } // end VStack
    } // end View body
} // end struct

#Preview {
    SettingsView(path: Binding.constant(NavigationPath()))
        .environment(Game())

}
