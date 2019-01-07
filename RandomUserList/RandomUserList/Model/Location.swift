//
//  Location.swift
//  RandomUserList
//
//  Created by Luis Alejandro Esparragoza Sanchez on 07/01/2019.
//  Copyright © 2019 LuisEsparragoza. All rights reserved.
//

import Foundation

struct Location: Codable {
    let street: String?
    let city: String?
    let state: String?

    
    enum CodingKeys: String, CodingKey {
        case street
        case city
        case state
    }
    
    init(street: String?, city: String?, state: String?){
        self.street = street
        self.city = city
        self.state = state
    }
}
