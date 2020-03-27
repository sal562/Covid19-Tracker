//
//  CountryInfo.swift
//  CovidTracker
//
//  Created by Sal B Amer on 3/27/20.
//  Copyright © 2020 Sal B Amer. All rights reserved.
//

import Foundation

struct CountryInfo: Codable {

//    let iso2: String
//    let iso3: String
//    let Id: Int
//    let lat: Int
//    let long: Int
    let flag: URL

    private enum CodingKeys: String, CodingKey {
//        case iso2 = "iso2"
//        case iso3 = "iso3"
//        case Id = "_id"
//        case lat = "lat"
//        case long = "long"
        case flag = "flag"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
//        iso2 = try values.decode(String.self, forKey: .iso2)
//        iso3 = try values.decode(String.self, forKey: .iso3)
//        Id = try values.decode(Int.self, forKey: .Id)
//        lat = try values.decode(Int.self, forKey: .lat)
//        long = try values.decode(Int.self, forKey: .long)
        flag = try values.decode(URL.self, forKey: .flag)
    }

}
