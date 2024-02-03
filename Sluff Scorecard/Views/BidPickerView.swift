//
//  BidPickerView.swift
//  Sluff Scorecard
//
//  Created by Chad Wallace on 2/1/24.
//

import SwiftUI

struct BidPickerView: View {
    
    @Bindable var appState: AppState
    var playerIndex: Int
    
    var body: some View {
        HStack {
            
//            Picker("", selection: $currentBid) {
//                ForEach(0...14, id: \.self) { currentBid in
//                    Text("\(currentBid)").foregroundColor(.blue)
//                }
//            }
            Picker("Bid:", selection: $appState.playersList[playerIndex].playerBid) {
                Text("Sluff").tag(0)
                Text("0").tag(0)
                Text("1").tag(1)
                Text("2").tag(2)
                Text("3").tag(3)
                Text("4").tag(4)
                Text("5").tag(5)
                Text("6").tag(6)
                Text("7").tag(7)
                Text("8").tag(8)
                Text("9").tag(9)
                Text("10").tag(10)
            }
        }
    }
}

//#Preview {
//    BidPickerView(appState: AppState())
//}

/*
ScrollView {
    ForEach(appState.playersList.indices, id: \.self) { index in
        VStack(alignment: .leading) {
            HStack{
                Text("Position \(index + 1):")
                    .fontWeight(.bold)
                TextField("Enter name", text: $appState.playersList[index].name)
                    .textFieldStyle(PlainTextFieldStyle())
                    .accentColor(.pink)
                    .foregroundColor(.blue)
                    .padding(4)
                    .background(.teal.opacity(0.3))
                    .cornerRadius(8)
            }
            
        } // end VStack
    } // end ForEach
} // end ScrollView
*/
