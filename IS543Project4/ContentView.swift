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
    
    var body: some View {
        
        VStack {
            
            ChuckNorisFactView(fact: viewModel.fact)

            Button(action: { self.viewModel.getChuckNorisFact() }) {
                Text("button")
            }
        
            
            
        }
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: .init())
    }
}


