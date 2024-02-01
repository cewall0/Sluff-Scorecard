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
                Text("")
                Text("")
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
            } // end VStack
        
    }
}

#Preview {
    EditablePlayerListView(appState: AppState())
}
