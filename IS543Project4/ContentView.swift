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
                
                Spacer()
                
                TextField("animal,food", text: self.$viewModel.category)
                    .border(Color.black)
                    .padding(.top)
                    .disabled(isChecked)
                
                TextField("Query", text: self.$viewModel.query)
                    .border(Color.black)
                    .padding()
                    .disabled(isChecked)
                
                TextField("Name", text: self.$viewModel.name)
                    .border(Color.black)
                    .padding()
                    .disabled(isChecked)


                HStack {
                    
                    Text("Random")
                    
                    Button(action: { self.toggle() }) {
                        Image(systemName: isChecked ? "checkmark.square": "square")
                    }
                    
                }.padding()
                
            }.frame(width: UIScreen.main.bounds.width / 2, height: 100)
            
            Spacer()
            
            Button(action: { self.viewModel.getQuote() }) {
                
                Text("Get Quote")
                    .bold()
                
            }.padding()
            
            Spacer()

        }
        
        
    }
        
    func toggle() {
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


