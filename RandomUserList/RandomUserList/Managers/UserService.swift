//
//  UserService.swift
//  RandomUserList
//
//  Created by Luis Alejandro Esparragoza Sanchez on 03/01/2019.
//  Copyright © 2019 LuisEsparragoza. All rights reserved.
//

import Foundation
import Alamofire

class UserService: NetworkManagerProtocol {
    
    var url = "api/"
    var headers = ["Accept" : "application/json"]
    var parameters: [String : Any]
    var httpMethod = HTTPMethod.get
    
    init(page: Int, pageSize: Int, seed: String) {
        self.parameters = ["page": page, "results": pageSize, "seed" : seed]
        
    }
    
}
