//
//  PersonController.swift
//  StarWarsSearch(iOSPT1)
//
//  Created by Dongwoo Pae on 5/23/19.
//  Copyright © 2019 Dongwoo Pae. All rights reserved.
//

import Foundation

class PersonController {
    
    enum HTTPMethod: String {
        case get = "GET"
        case put = "PUT"
        case post = "POST"
        case delete = "Delete"
    }
    
    var people: [Person] = []
    
    let baseURL = URL(string: "https://swapi.co/api/people")!

    func searchForPeopleWith(searchTerm: String, completion: @escaping () -> Void) {
        // 1. Base URL
        // 2. Set up URL Components and Query Items
        // 3. Add query items to URL Components
        // 4. Get final URL from URL Components
        // 5. Create URL Request with URL
        // 6. Set HTTP method
        // 7. Create data task with URL Request
        //  a. handle error
        //  b. safley unwrap data
        //  c. decod dtat(set stragtegy if neccesary)
        //  d. set self.people = decodedData
        var urlComponents = URLComponents(url: baseURL, resolvingAgainstBaseURL: true) //this gets ? as well and this is what needs  https://swapi.co/api/people/?search=r2 to get the search result from RESTAPI
        
        let searchTermQueryItem = URLQueryItem(name: "search", value: searchTerm)
        
        urlComponents?.queryItems = [searchTermQueryItem]
        
        guard let requestURL = urlComponents?.url else {NSLog("requestURL is nil"); completion(); return}
        
        var request  = URLRequest(url: requestURL)
        
        request.httpMethod = HTTPMethod.get.rawValue   //enum's value which is "GET"
        
        //data task
        
        URLSession.shared.dataTask(with: request) { (data, _, error) in   //this already has "GET" so you wont need to have enum above but it was just for practice
           if let error = error {
                NSLog("Error getching data \(error)")
                completion()
                return
            }
            
            guard let data = data else {
                NSLog("No data returned from data task")
                completion()
                return
            }
            
            let jsonDecoder = JSONDecoder()
            
            do {
                jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
                let personSearch = try jsonDecoder.decode(PersonSearch.self, from: data)
                self.people = personSearch.results
            } catch {
                NSLog("unable to complete \(error)")
            }
                completion()
        }.resume()   //data task wont run if you dont use this resume()
    }
}
