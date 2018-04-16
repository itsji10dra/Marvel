//
//  Response.swift
//  Marvel
//
//  Created by Jitendra on 16/04/18.
//  Copyright © 2018 Jitendra Gandhi. All rights reserved.
//

import Foundation

struct Response<T> {
    
    var code: Int?
    
    var status: String?
    
    var copyright: String?
    
    var attributionText: String?
    
    var attributionHTML: String?
    
    var eTag: String?
    
    var data: ResponseData<T>?
}

extension Response where T: Initializer {
    
    init(with json: JSON) {
        self.code = json["code"] as? Int
        self.status = json["status"] as? String
        self.copyright = json["copyright"] as? String
        self.attributionText = json["attributionText"] as? String
        self.attributionHTML = json["attributionHTML"] as? String
        self.eTag = json["etag"] as? String
        
        if let data = json["data"] as? JSON {
            self.data = ResponseData<T>.init(with: data)
        } else {
            self.data = nil
        }
    }
}
