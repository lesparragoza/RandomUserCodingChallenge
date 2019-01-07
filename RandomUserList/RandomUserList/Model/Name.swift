//
//  Name.swift
//  RandomUserList
//
//  Created by Luis Alejandro Esparragoza Sanchez on 06/01/2019.
//  Copyright © 2019 LuisEsparragoza. All rights reserved.
//

import Foundation

struct Name: Codable {
    let firstName: String
    let lastName: String
    
    enum CodingKeys: String, CodingKey {
        case firstName = "first"
        case lastName = "last"
    }
    
    init(name: String, lastName: String){
        self.firstName = name
        self.lastName = lastName
    }
}
