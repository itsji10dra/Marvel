//
//  ResponseData.swift
//  Marvel
//
//  Created by Jitendra on 16/04/18.
//  Copyright © 2018 Jitendra Gandhi. All rights reserved.
//

import Foundation

struct ResponseData<T>: Decodable where T: Decodable {
    
    var offset: Int?
    
    var limit: Int?
    
    var total: Int?
    
    var count: Int?
    
    var results: T?
}


