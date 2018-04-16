//
//  ResponseData+Initializer.swift
//  Marvel
//
//  Created by Jitendra on 16/04/18.
//  Copyright © 2018 Jitendra Gandhi. All rights reserved.
//

import Foundation

extension ResponseData where T: Initializer {
    
    init(with json: JSON) {
        self.offset = json["offset"] as? Int
        self.limit = json["limit"] as? Int
        self.total = json["total"] as? Int
        self.count = json["count"] as? Int
        
        if let results = json["results"] as? [JSON] {
            self.results = results.compactMap { T.init(with: $0) } 
        } else {
            self.results = nil
        }
    }
}
