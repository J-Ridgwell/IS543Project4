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
        .padding()
        
//        layer.cornerRadius = 20.0
//        layer.shadowColor = UIColor.gray.cgColor
//        layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
//        layer.shadowRadius = 12.0
//        self.layer.shadowOpacity = 0.7
    }
    
    
}

struct ChuckNorisFactView_Previews: PreviewProvider {

    static var previews: some View {
        
        ChuckNorisFactView(fact: ChuckNorisFact())
        
    }
}
