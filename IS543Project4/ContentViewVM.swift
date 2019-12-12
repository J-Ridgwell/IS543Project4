//
//  ContentViewVM.swift
//  IS543Project4
//
//  Created by Jacob Ridgwell on 12/11/19.
//  Copyright © 2019 Jacob Ridgwell. All rights reserved.
//

import SwiftUI
import Combine

class ContentViewVM : ObservableObject {
        
    @Published var fact: ChuckNorisFact?
    
    func getChuckNorisFact() {
        guard let url = URL(string: "https://api.chucknorris.io/jokes/random") else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else {
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .secondsSince1970
                
                let chuckNorisFactObj = try decoder.decode(ChuckNorisFact.self, from: data)
                
                DispatchQueue.main.async {
                    self.fact = chuckNorisFactObj
                }
            } catch {
                print(error.localizedDescription)
            }
        }.resume()
    }}
