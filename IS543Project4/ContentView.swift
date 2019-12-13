//
//  ContentView.swift
//  IS543Project4
//
//  Created by Jacob Ridgwell on 12/11/19.
//  Copyright © 2019 Jacob Ridgwell. All rights reserved.
//

import SwiftUI
import Foundation

struct ContentView: View {
    
    @ObservedObject var viewModel = ContentViewVM()
    @State var isChecked: Bool = false
    @State var queryChecked: Bool = false
    
    var body: some View {
        
        VStack {
            Image("chuckNorisPixelArt")

            ChuckNorisFactView(fact: viewModel.fact)
                .padding()
                .shadow(color: Color.gray, radius: 1)
                .border(Color.gray, width: 1)
                .cornerRadius(3)

            Spacer()
            
            VStack {
                Divider()
                Spacer()
                
                TextField("category", text: self.$viewModel.category)
                    .padding()
                    .border(Color.black)
                    .padding(.leading)
                    .padding(.trailing)
                    .disabled(isChecked)
                
                TextField("Query", text: self.$viewModel.query)
                    .padding()
                    .border(Color.black)
                    .padding(.leading)
                    .padding(.trailing)
                    .disabled(isChecked)
                
                TextField("Name", text: self.$viewModel.name)
                    .padding()
                    .border(Color.black)
                    .padding(.leading)
                    .padding(.trailing)
                    .disabled(isChecked)


                HStack {
                    
                    Text("Random")
                    
                    Button(action: { self.toggle() }) {
                        Image(systemName: isChecked ? "checkmark.square": "square")
                    }
                    
                }.padding()
                
            }
            
            Spacer()
            
            Button(action: {
                self.viewModel.getQuote()
                
            }) {
                
                Text("Get Quote")
                    .bold()
                
            }.padding()
            
            Spacer()

        }
        
        
    }
        
    func toggle() {
        self.viewModel.random = !isChecked
        isChecked = !isChecked
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(
            viewModel: ContentViewVM(), isChecked: false, queryChecked: false
        )
    }
}


