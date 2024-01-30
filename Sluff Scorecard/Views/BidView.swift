//
//  BidView.swift
//  Sluff Scorecard
//
//  Created by Chad Wallace on 1/27/24.
//

import SwiftUI
import Observation

struct BidView: View {
    
    @Bindable var viewModel = BidViewViewModel()
    
    var body: some View {
        VStack{
            Text("Player Bid")
                .font(.system(size: 32))
                .bold()
                .padding(.top, 10)
            
            Form{
                List {
                    Picker("Bid", selection: $viewModel.bid) {
                        ForEach(0...14, id: \.self){ number in
                            Text("\(number)").tag("\(number)")
                        }
                    }
                }
                
                Toggle("Is Sluffing", isOn: $viewModel.didSluff)
                
                Button("Next Bid") {
                    
                }
            } // end form
            
            Text("The bid is: \(viewModel.bid)")
            HStack{
                Text("The Sluff value is:")
                if viewModel.didSluff == false {
                    Text("false")
                } else {
                    Text("true")
                }
            }
           
               
            
           
        } // end VStack
    } // end body: some View
} // end struct NewItemView

#Preview {
    BidView()
}
