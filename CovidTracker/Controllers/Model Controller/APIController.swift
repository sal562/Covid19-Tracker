//
//  APIController.swift
//  CovidTracker
//
//  Created by Sal B Amer on 3/23/20.
//  Copyright © 2020 Sal B Amer. All rights reserved.
//https://interactive-static.scmp.com/sheet/wuhan/viruscases.json
// OPTION 2 with images array https://corona.lmao.ninja/countries

import UIKit

enum HTTPMethod: String {
    case get = "GET"
    case put = "PUT"
    case post = "POST"
    case delete = "DELETE"
}

class APIController {
//    let baseURL = URL(string: "https://interactive-static.scmp.com/sheet/wuhan/viruscases.json")!
     let baseURL = URL(string: "https://corona.lmao.ninja/countries")!
    
    typealias CompletionHandler = (Error?) -> Void
    
    //  fetch results and put them in an array
//    var results: [Entry] = [] - v1
    var entries = [Entry]()
    
//    var results = Entry.self
    
    // fetch results from API
    func fetchResults(completion: @escaping CompletionHandler = { _ in }) {
        var request = URLRequest(url: baseURL)
        request.httpMethod = HTTPMethod.get.rawValue
        
        
        //URL Session
        URLSession.shared.dataTask(with: request) { data, _, error in
            if let error = error {
                print("Error fetching data from API: \(error)")
                DispatchQueue.main.async {
                    completion(error)
                }
                return
            }
            guard let data = data else {
                print("Unable to fetch data from server: \(error)")
                DispatchQueue.main.async {
                    completion(error)
                }
                return
            }
            // do try block
            do {
                let fetchedResults = try JSONDecoder().decode([Entry].self, from: data)
                for result in fetchedResults {
                    self.entries.append(result)
                }
                DispatchQueue.main.async {
                    completion(nil)
                }
            } catch {
                print("Error Decoding results from server call: \(error)")
                DispatchQueue.main.async {
                    completion(error)
                }
                return
            }
        }.resume()
        
        
    }
    
    
}
