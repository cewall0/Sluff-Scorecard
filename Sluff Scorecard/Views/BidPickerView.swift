//
//  BidPickerView.swift
//  Sluff Scorecard
//
//  Created by Chad Wallace on 2/1/24.
//

import SwiftUI

struct BidPickerView: View {
    
    @Bindable var appState: AppState
    @State var currentBid: Int = 0

    var body: some View {
        HStack {
            Text("Bid:")
            Text(String(currentBid))
                .fontWeight(.bold)
                .foregroundColor(Color.red)
                
        }
        
        Picker("Player's Bid:", selection: $currentBid) {
            ForEach(0...14, id: \.self) { currentBid in
                Text("\(currentBid)")
            }
        }
    }
}

#Preview {
    BidPickerView(appState: AppState())
}

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
