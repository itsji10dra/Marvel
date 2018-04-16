//
//  URLInfo.swift
//  Marvel
//
//  Created by Jitendra on 16/04/18.
//  Copyright © 2018 Jitendra Gandhi. All rights reserved.
//

import Foundation

struct URLInfo {
    
    var type: String?
    
    var url: URL?
}

extension URLInfo: Initializer {
    
    init(with json: JSON) {
        self.type = json["type"] as? String
        self.url = URL(string: json["url"] as? String)
    }
}
