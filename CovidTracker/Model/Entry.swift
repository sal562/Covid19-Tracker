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
    // OPTION 2 - Both Models combined ( cannot get rid of errors)

//struct CountryInfo: Decodable {
//        let flag: String
//    }
//
//struct Entry: Decodable {
//    let countryInfo: CountryInfo
//    let country: String
//    let cases: Int
//    let todayCases: Int
//    let deaths: Int
//    let todayDeaths: Int
//    let recovered: Int
//    let active: Int
//    let critical: Int
//    let casesPerOneMillion: Int
//    let deathsPerOneMillion: Int
//
//
//    enum CodingKeys: String, CodingKey {
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
//        enum CountryInfoKeys: String, CodingKey {
//            case flag
//        }
//      }
//
//
//        init(from decoder: Decoder) throws {
//            let container = try decoder.container(keyedBy: CodingKeys.self)
//            country = try container.decode(String.self, forKey: .country)
//            cases = try container.decode(Int.self, forKey: .cases)
//            todayCases = try container.decode(Int.self, forKey: .todayCases)
//            deaths = try container.decode(Int.self, forKey: .deaths)
//            todayDeaths = try container.decode(Int.self, forKey: .todayDeaths)
//            recovered = try container.decode(Int.self, forKey: .recovered)
//            active = try container.decode(Int.self, forKey: .active)
//            critical = try container.decode(Int.self, forKey: .critical)
//            casesPerOneMillion = try container.decode(Int.self, forKey: .casesPerOneMillion)
//            deathsPerOneMillion = try container.decode(Int.self, forKey: .deathsPerOneMillion)
//            countryInfo = try container.decode(CountryInfo.self, forKey: .countryInfo)
//
//            let flagContainer = try decoder.container(keyedBy: CodingKeys.CountryInfoKeys.self)
//
//            var flag = try flagContainer.decode(String.self, forKey: .flag)
//        }
//       }
//
     // OPTION 3 - Both Model Seperated

struct Entry: Codable {

    let country: String
    let countryInfo: CountryInfo
    let cases: Int
    let todayCases: Int
    let deaths: Int
    let todayDeaths: Int
    let recovered: Int
    let active: Int
    let critical: Int
    let casesPerOneMillion: Double
    let deathsPerOneMillion: Double

    private enum CodingKeys: String, CodingKey {
        case country = "country"
        case countryInfo = "countryInfo"
        case cases = "cases"
        case todayCases = "todayCases"
        case deaths = "deaths"
        case todayDeaths = "todayDeaths"
        case recovered = "recovered"
        case active = "active"
        case critical = "critical"
        case casesPerOneMillion = "casesPerOneMillion"
        case deathsPerOneMillion = "deathsPerOneMillion"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        country = try values.decode(String.self, forKey: .country)
        countryInfo = try values.decode(CountryInfo.self, forKey: .countryInfo)
        cases = try values.decode(Int.self, forKey: .cases)
        todayCases = try values.decode(Int.self, forKey: .todayCases)
        deaths = try values.decode(Int.self, forKey: .deaths)
        todayDeaths = try values.decode(Int.self, forKey: .todayDeaths)
        recovered = try values.decode(Int.self, forKey: .recovered)
        active = try values.decode(Int.self, forKey: .active)
        critical = try values.decode(Int.self, forKey: .critical)
        casesPerOneMillion = try values.decode(Double.self, forKey: .casesPerOneMillion)
        deathsPerOneMillion = try values.decode(Double.self, forKey: .deathsPerOneMillion)
    }

}
