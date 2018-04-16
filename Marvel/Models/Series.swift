//
//  Series.swift
//  Marvel
//
//  Created by Jitendra on 16/04/18.
//  Copyright © 2018 Jitendra Gandhi. All rights reserved.
//

import Foundation

struct Series: Resource {
    
    var resourceURI: URL?
    
    var name: String?
}

extension Series: Initializer {
    
    init(with json: JSON) {
        self.resourceURI = URL(string: json["resourceURI"] as? String)
        self.name = json["name"] as? String
    }
}
