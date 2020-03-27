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


struct CountryInfo: Decodable {
    var flag: String
}


struct Entry: Decodable {
    let countryInfo: [CountryInfo]
    let country: String
    let cases: Int
    let todayCases: String
    let deaths: Int
    let todayDeaths: String
    let recovered: Int
    let active: String
    let critical: String
    let casesPerOneMillion: String
    let deathsPerOneMillion: String


    enum CodingKeys: String, CodingKey {
        case country
        case CountryInfo
        case cases
        case todayCases
        case deaths
        case todayDeaths
        case recovered
        case active
        case critical
        case casesPerOneMillion
        case deathsPerOneMillion
        
        enum flagKeys: String, CodingKey {
            case flag
        }
      }
    

        init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            country = try container.decode(String.self, forKey: .country)
            cases = try container.decode(Int.self, forKey: .cases)
            todayCases = try container.decode(String.self, forKey: .todayCases)
            deaths = try container.decode(Int.self, forKey: .deaths)
            todayDeaths = try container.decode(String.self, forKey: .todayDeaths)
            recovered = try container.decode(Int.self, forKey: .recovered)
            active = try container.decode(String.self, forKey: .active)
            critical = try container.decode(String.self, forKey: .critical)
            casesPerOneMillion = try container.decode(String.self, forKey: .casesPerOneMillion)
            deathsPerOneMillion = try container.decode(String.self, forKey: .deathsPerOneMillion)
            countryInfo = try container.decode([CountryInfo].self, forKey: .CountryInfo)
            
            let flagContainer = try decoder.container(keyedBy: CodingKeys.flagKeys.self)
            let flag = try flagContainer.decode(String.self, forKey: .flag)
        }
       }
  
 

