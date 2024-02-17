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
            Text("Sluff Scorecard")
                .font(.system(size: 32))
                .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                .bold()
                .padding(.top, 10)
            Spacer()
            Button {
                router.reset()
                router.path.append(3)
            } label: {
                Image(systemName: "gear")
            }
            .padding(.trailing)
            .foregroundColor(.gray)

        }
        Text("(Round: \(game.round))")
    }
}


#Preview {
    TitleView()
        .environment(Game())
}
 
