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
//struct Countries: Codable {
//    var country: String
//    var countryInfo: CountryInfo
//    var cases: Int
//    var todayCases: Int
//    var deaths: Int
//    var todayDeaths: Int
//    var recovered: Int
//    var active: Int
//    var critical: Int
//    var casesPerOneMillion: Int
//    var deathsPerOneMillion: Int
//
//     enum CountryKeys: String, CodingKey {
//        case country
//        case countryInfo
//        case cases
//        case todayCases
//        case deaths
//        case todayDeaths
//        case recovered
//        case active
//        case critical
//        case casesPerOneMillion
//        case deathsPerOneMillion
//
//
//    }
//
//    struct CountryInfo: Codable {
//        var flag: URL
//        private enum CodingKeys: String, CodingKey {
//            case flag
//        }
//
//        init(from decoder: Decoder) throws {
//            let flagContainer = try decoder.container(keyedBy: CodingKeys.self)
//            flag = try flagContainer.decode(URL.self, forKey: .flag)
//            let container = try decoder.container(keyedBy: CountryKeys.self)
//            country = try container.decode(String.self, forKey: .country)
//
//
//      }
//    }
//}
    
//OPTION 3 - COMBINE


//struct CountryInfo: Decodable {
//    var flag: String
//}

struct Entry: Decodable {
//    let countryInfo: [CountryInfo]
    let country: String
    let cases: Int
//    let todayCases: String
    let deaths: Int
//    let todayDeaths: String
    let recovered: Int
//    let active: String
//    let critical: String
//    let casesPerOneMillion: String
//    let deathsPerOneMillion: String


    enum CodingKeys: String, CodingKey {
        case country
//        case CountryInfo
        case cases
//        case todayCases
        case deaths
//        case todayDeaths
        case recovered
//        case active
//        case critical
//        case casesPerOneMillion
//        case deathsPerOneMillion
      }


        init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            country = try container.decode(String.self, forKey: .country)
            cases = try container.decode(Int.self, forKey: .cases)
//            todayCases = try container.decode(String.self, forKey: .todayCases)
            deaths = try container.decode(Int.self, forKey: .deaths)
//            todayDeaths = try container.decode(String.self, forKey: .todayDeaths)
            recovered = try container.decode(Int.self, forKey: .recovered)
//            active = try container.decode(String.self, forKey: .active)
//            critical = try container.decode(String.self, forKey: .critical)
//            casesPerOneMillion = try container.decode(String.self, forKey: .casesPerOneMillion)
//            deathsPerOneMillion = try container.decode(String.self, forKey: .deathsPerOneMillion)
        }
        
       }
  


    
//        init(from decoder: Decoder) throws {
//            let values = try decoder.container(keyedBy: CodingKeys.self)
////            iso2 = try values.decode(String.self, forKey: .iso2)
////            iso3 = try values.decode(String.self, forKey: .iso3)
////            Id = try values.decode(Int.self, forKey: .Id)
////            lat = try values.decode(Int.self, forKey: .lat)
////            long = try values.decode(Int.self, forKey: .long)
//            flag = try values.decode(String.self, forKey: .flag)
//        }

//    }
    



