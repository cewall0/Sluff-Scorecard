//
//  EditablePlayerListView.swift
//  Sluff Scorecard
//
//  Created by Chad Wallace on 1/31/24.
//

import SwiftUI

struct EditablePlayerListView: View {
    
    @Bindable var appState: AppState
    @State var newName: String = ""
    
    var body: some View {
        VStack {
            List {
                ForEach(appState.playersList.indices, id: \.self) { index in
                    VStack(alignment: .leading) {
                        Text("Position \(index + 1):")
                            .fontWeight(.bold)
                        TextField("Enter name", text: $appState.playersList[index].name)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                    } // end VStack
                } // end ForEach
            } // end List
        } // end VStack
    }
}

#Preview {
    EditablePlayerListView(appState: AppState())
}
