//
//  Entry.swift
//  CovidTracker
//
//  Created by Sal B Amer on 3/22/20.
//  Copyright © 2020 Sal B Amer. All rights reserved.
//
//https://interactive-static.scmp.com/sheet/wuhan/viruscases.json

import Foundation

struct Entries: Codable {
        var entries: [Entry]
    }

struct Entry: Codable {
    var country: String
    var cases: String
    var deaths: String
    var recovered: String
    
    enum EntryKeys: String, CodingKey {
        case country
        case cases
        case deaths
        case recovered
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: EntryKeys.self)
        country = try container.decode(String.self, forKey: .country)
        cases = try container.decode(String.self, forKey: .cases)
        deaths = try container.decode(String.self, forKey: .deaths)
        recovered = try container.decode(String.self, forKey: .recovered)
    }
}
    
    
    
