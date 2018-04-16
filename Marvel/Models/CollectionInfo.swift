//
//  CollectionInfo.swift
//  Marvel
//
//  Created by Jitendra on 16/04/18.
//  Copyright © 2018 Jitendra Gandhi. All rights reserved.
//

import Foundation

struct CollectionInfo<T> where T: Resource {
    
    var available: Int?
    
    var collectionURI: URL?
    
    var returned: Int?
    
    var collection: [T]?
}
