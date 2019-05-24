//
//  Person.swift
//  StarWarsSearch(iOSPT1)
//
//  Created by Dongwoo Pae on 5/23/19.
//  Copyright © 2019 Dongwoo Pae. All rights reserved.
//

import Foundation

struct Person: Decodable {

    let name: String
    let gender: String
    let birthYear: String
    
}

// we give this becuase name/gender/birthYear are inside of Results
struct PersonSearch: Decodable {
    let results: [Person]
}
