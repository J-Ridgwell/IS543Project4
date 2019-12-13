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
        
    @Published var fact: ChuckNorisFact = ChuckNorisFact()
    
    var category: String = ""
    var query: String = ""
    var name: String = ""
    
    private var urlExtension: String = ""
    private var URL_BASE: String = "https://api.chucknorris.io/jokes/"
    
    func getQuote() {
        self.buildUrl()
        self.apiCaller()
    }
    
    private func apiCaller() {
        let urlString = "\(URL_BASE)\(urlExtension.lowercased())"
        guard let url = URL(string: urlString) else {
            return
        }

        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else {
                return
            }

            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .secondsSince1970

            do {
                
                let chuckNorisFactObj = try decoder.decode(ChuckNorisFact.self, from: data)
                
                DispatchQueue.main.async {
                    self.fact = chuckNorisFactObj
                    print(self.fact.value ?? "No fact")
                }
            } catch {
                print(error.localizedDescription)
                
                do {
                    let facts = try decoder.decode(Facts.self, from: data)
                    
                    DispatchQueue.main.async {
                        self.fact = facts.result[Int.random(in: 0..<facts.result.count)]
                        print(facts)
                    }
                } catch {
                    print(error)
                }
                
            }
        }.resume()
    }
    
    private func buildUrl() {
                
        if (self.query != "") {
            urlExtension = "search?query=\(self.query)"
            return
        }
        
        if (self.name != "") {
            urlExtension += "random?name=\(self.name)"
            
            if (self.category != "") {
                urlExtension += "&category=\(category)"
            }
            
        }
        urlExtension += "random?"
        
        if (self.category != "") {
            urlExtension += "category=\(category)"
        }
        
    }

}
