//
//  Response.swift
//  Marvel
//
//  Created by Jitendra on 16/04/18.
//  Copyright © 2018 Jitendra Gandhi. All rights reserved.
//

import Foundation

struct Response<T>: Decodable where T: Decodable {
    
    var code: Int?
    
    var status: String?
    
    var copyright: String?
    
    var attributionText: String?
    
    var attributionHTML: String?
    
    var eTag: String?
    
    var data: ResponseData<T>?
    
    private enum CodingKeys: String, CodingKey {
        case code
        case status
        case copyright
        case attributionText
        case attributionHTML
        case eTag = "etag"
        case data
    }
}

