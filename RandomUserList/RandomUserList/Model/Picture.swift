//
//  Picture.swift
//  RandomUserList
//
//  Created by Luis Alejandro Esparragoza Sanchez on 07/01/2019.
//  Copyright © 2019 LuisEsparragoza. All rights reserved.
//

import Foundation

struct Picture: Codable {
    let thumbnailUrl: String?
    let largeUrl: String?
    
    enum CodingKeys: String, CodingKey {
        case thumbnailUrl = "thumbnail"
        case largeUrl = "large"
    }
    
    init(thumbnailUrl: String?, largeUrl: String?){
        self.thumbnailUrl = thumbnailUrl
        self.largeUrl = largeUrl
    }
}
