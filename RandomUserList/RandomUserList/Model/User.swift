//
//  User.swift
//  RandomUserList
//
//  Created by Luis Alejandro Esparragoza Sanchez on 02/01/2019.
//  Copyright © 2019 LuisEsparragoza. All rights reserved.
//

import Foundation

struct User: Codable {
    let name: Name
    let phone: String?
    let picture: Picture?
    let location: Location?
    
    enum CodingKeys: String, CodingKey {
        case name
        case phone
        case picture
        case location
    }
    
    init(name: Name, phone: String?, picture: Picture?, location: Location?){
        self.name = name
        self.phone = phone
        self.picture = picture
        self.location = location
    }
}
