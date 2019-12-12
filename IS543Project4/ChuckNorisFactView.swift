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
        
        VStack {
//            ImageView(withURL: fact?.icon_url ?? "none")
            Text(fact?.value ?? "URL")
        }
        
    }
    
}

struct ChuckNorisFactView_Previews: PreviewProvider {
        
    static var previews: some View {
        ChuckNorisFactView(
            fact: ChuckNorisFact(
                icon_url: "URL", id: "0", url: "NONE", value: "loading"
                )
        )
        
    }
}
