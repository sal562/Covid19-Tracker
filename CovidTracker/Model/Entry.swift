//
//  Entry.swift
//  CovidTracker
//
//  Created by Sal B Amer on 3/22/20.
//  Copyright © 2020 Sal B Amer. All rights reserved.
//
//OPTION 2 plain - https://interactive-static.scmp.com/sheet/wuhan/viruscases.json

// OPTION 2 with images array https://corona.lmao.ninja/countries

import Foundation

// OPTION 1
/*... */
/*
 
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

*/
    // OPTION 2 - NEW
struct Countries: Codable {
    var country: String
    var countryInfo: CountryInfo
    var cases: Int
    var todayCases: Int
    var deaths: Int
    var todayDeaths: Int
    var recovered: Int
    var active: Int
    var critical: Int
    var casesPerOneMillion: Int
    var deathsPerOneMillion: Int
    
    struct CountryInfo: Codable {
        var flag: URL
        private enum CodingKeys: String, CodingKey {
            case flag
        }
    }
}
    
