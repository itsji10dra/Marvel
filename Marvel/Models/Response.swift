//
//  Response.swift
//  Marvel
//
//  Created by Jitendra on 16/04/18.
//  Copyright © 2018 Jitendra Gandhi. All rights reserved.
//

import Foundation

struct Response {
    
    var code: Int?
    
    var status: String?
    
    var copyright: String?
    
    var attributionText: String?
    
    var attributionHTML: String?
    
    var eTag: String?
    
    var data: ResponseData<Character>
}
