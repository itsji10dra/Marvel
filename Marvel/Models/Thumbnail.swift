//
//  Thumbnail.swift
//  Marvel
//
//  Created by Jitendra on 16/04/18.
//  Copyright © 2018 Jitendra Gandhi. All rights reserved.
//

import Foundation

struct Thumbnail: Decodable {
    
    private var path: String?
    
    private var `extension`: String?
    
    var thumbURL: URL? {
        guard let path = self.path,
            let extensn = self.extension else { return nil }
        
        let stringURL = path + "." + extensn
        return URL(string: stringURL)
    }
}

