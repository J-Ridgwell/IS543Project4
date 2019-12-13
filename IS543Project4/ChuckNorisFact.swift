//
//  ChuckNorisFact.swift
//  IS543Project4
//
//  Created by Jacob Ridgwell on 12/11/19.
//  Copyright © 2019 Jacob Ridgwell. All rights reserved.
//

struct ChuckNorisFact: Codable {
    
    init() {
        categories = ["animal"]
        created_at = "2016-05-01 10:51:41.584544"
        icon_url = "https://assets.chucknorris.host/img/avatar/chuck-norris.png"
        id = "o0sukejatqchi7oyjms6mw"
        updated_at = "2016-05-01 10:51:41.584544"
        url = "https://api.chucknorris.io/jokes/o0sukejatqchi7oyjms6mw"
        value = "Chuck Norris can set ants on fire with a magnifying glass. At night."
    }
    
    
    var categories: [String]
    var created_at: String
    var icon_url: String
    var id: String
    var updated_at: String
    var url: String
    var value: String
    
}

struct Facts: Codable {
    
    var total: Int
    var result: [ChuckNorisFact]
}
