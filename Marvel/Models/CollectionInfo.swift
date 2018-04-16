//
//  CollectionInfo.swift
//  Marvel
//
//  Created by Jitendra on 16/04/18.
//  Copyright © 2018 Jitendra Gandhi. All rights reserved.
//

import Foundation

struct CollectionInfo<T> where T: Resource, T: Initializer {
    
    var available: Int?
    
    var collectionURI: URL?
    
    var returned: Int?
    
    var items: [T]?
}

extension CollectionInfo: Initializer {
    
    init(with json: JSON) {
        self.available = json["available"] as? Int
        self.collectionURI = URL(string: json["collectionURI"] as? String)
        self.returned = json["returned"] as? Int
        
        if let items = json["items"] as? [JSON] {
            self.items = items.compactMap { T.init(with: $0) }
        } else {
            self.items = nil
        }
    }
}

