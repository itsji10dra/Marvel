//
//  URLInfo.swift
//  Marvel
//
//  Created by Jitendra on 16/04/18.
//  Copyright © 2018 Jitendra Gandhi. All rights reserved.
//

import Foundation

struct URLInfo {
    
    var type: URLType = .unknown
    
    var url: URL?
}

extension URLInfo: Initializer {
    
    init(with json: JSON) {
        
        if let type = json["type"] as? String {
            self.type = URLType(rawValue: type) ?? .unknown
        } else {
            self.type = .unknown
        }
        
        self.url = URL(string: json["url"] as? String)
    }
}
