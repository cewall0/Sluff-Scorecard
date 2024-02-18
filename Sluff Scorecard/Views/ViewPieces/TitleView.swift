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
    
    var body: some View {
        HStack{
            Image(systemName: "gear").opacity(0).padding(.leading)
            Spacer()
            Image("color sluff scorecard")
                .resizable()
                .frame(width: 200, height: 80)
                
            Spacer()
            Button {
                router.path.append(3)
            } label: {
                Image(systemName: "gear")
            }
            .padding(.trailing)
            .foregroundColor(.gray)

        }
        Text("(Round: \(game.round)/\(game.numberOfPlayers))")
    }
}


#Preview {
    TitleView()
        .environment(Game())
}
 
