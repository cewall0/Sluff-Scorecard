//
//  TitleView.swift
//  Sluff Scorecard
//
//  Created by Chad Wallace on 2/5/24.
//

import SwiftUI

struct TitleView: View {
    
    @Environment(Game.self) private var game
    
    @Binding var path: NavigationPath
    
    func reset() {
        self.path = NavigationPath()
    }
    
    @Environment(\.verticalSizeClass) var heightSizeClass: UserInterfaceSizeClass?
    @Environment(\.horizontalSizeClass) var widthSizeClass: UserInterfaceSizeClass?
    
    
    var body: some View {
        
        HStack{
            
            Button {
                path.append(5)
            } label: {
                Image(systemName: "list.clipboard")
                    .font(widthSizeClass == .regular ? .title2 : .title3)
            }
            .padding(.leading)
            .foregroundStyle(game.round<2 ? .clear: .gray)
            .disabled(game.round<2)
            
            Spacer()
            
            Image("SluffScorecardTitleSVG")
                .resizable()
                .frame(width: (CGFloat(15 * 100/game.numberOfPlayers)), height: (CGFloat(8 * 100/game.numberOfPlayers)))
                
            Spacer()
            
            Button {
                path.append(3)
            } label: {
                Image(systemName: "gear")
                    .font(widthSizeClass == .regular ? .title2 : .title3)
            }
            .padding(.trailing)
            .foregroundColor(.gray)

        }
        .padding(.top, -15)
        .padding(.bottom, -20)

    }
}


#Preview {
    TitleView(path: Binding.constant(NavigationPath()))
        .environment(Game())
}
 
