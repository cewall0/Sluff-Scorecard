//
//  TitleView.swift
//  Sluff Scorecard
//
//  Created by Chad Wallace on 2/5/24.
//

import SwiftUI

struct TitleView: View {
    
    @Environment(Game.self) private var game
    @EnvironmentObject var router: Router
    
    @Environment(\.verticalSizeClass) var heightSizeClass: UserInterfaceSizeClass?
    @Environment(\.horizontalSizeClass) var widthSizeClass: UserInterfaceSizeClass?
    
    var body: some View {
        
        HStack{
            
            Button {
                router.path.append(5)
            } label: {
                Image(systemName: "list.clipboard")
                    .font(widthSizeClass == .regular ? .title2 : .title3)
            }
            .padding(.leading)
            .foregroundColor(.gray)
            
            Spacer()
            
            Image("SluffScorecardTitleSVG")
                .resizable()
                .frame(width: 250, height: 140)
                
            Spacer()
            
            Button {
                router.path.append(3)
            } label: {
                Image(systemName: "gear")
                    .font(widthSizeClass == .regular ? .title2 : .title3)
            }
            .padding(.trailing)
            .foregroundColor(.gray)

        }
        .padding(.bottom, -30)
        .padding(.top, -20)
        
        Text("(Round: \(game.round)/\(game.numberOfPlayers))")
//            .environment(Game())
//            .environmentObject(Router())
            .padding(.bottom, 10)
    }
}


#Preview {
    TitleView()
        .environment(Game())
}
 
