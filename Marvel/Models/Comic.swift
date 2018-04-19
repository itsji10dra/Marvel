//
//  Comic.swift
//  Marvel
//
//  Created by Jitendra on 16/04/18.
//  Copyright © 2018 Jitendra Gandhi. All rights reserved.
//

import Foundation

struct Comic: Resource, Decodable {
    
    var resourceURI: URL?
    
    var name: String?
}
