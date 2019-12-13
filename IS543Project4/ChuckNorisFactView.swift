//
//  ChuckNorisFactView.swift
//  IS543Project4
//
//  Created by Jacob Ridgwell on 12/11/19.
//  Copyright © 2019 Jacob Ridgwell. All rights reserved.
//

import SwiftUI

struct ChuckNorisFactView: View {
    
    let fact: ChuckNorisFact?
    
    var body: some View {
        
           Text(fact?.value ?? "")
        
    }
    
    
    
}

struct ChuckNorisFactView_Previews: PreviewProvider {

    static var previews: some View {
        
        ChuckNorisFactView(fact: ChuckNorisFact())
        
    }
}
