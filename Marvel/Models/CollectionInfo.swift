//
//  CollectionInfo.swift
//  Marvel
//
//  Created by Jitendra on 16/04/18.
//  Copyright © 2018 Jitendra Gandhi. All rights reserved.
//

import Foundation

struct CollectionInfo<T>: Decodable where T: Resource, T: Decodable {
    
    var available: Int?
    
    var collectionURI: URL?
    
    var returned: Int?
    
    var items: [T]?
}
