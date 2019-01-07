//
//  Result.swift
//  RandomUserList
//
//  Created by Luis Alejandro Esparragoza Sanchez on 07/01/2019.
//  Copyright © 2019 LuisEsparragoza. All rights reserved.
//

import Foundation

struct Result: Codable {
    let users: [User]?
    
    enum CodingKeys: String, CodingKey {
        case users = "results"
    }
    
    init(users: [User]?){
        self.users = users
    }
}
