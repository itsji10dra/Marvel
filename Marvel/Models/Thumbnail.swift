//
//  Thumbnail.swift
//  Marvel
//
//  Created by Jitendra on 16/04/18.
//  Copyright © 2018 Jitendra Gandhi. All rights reserved.
//

import Foundation

struct Thumbnail {
    
    var path: String?
    
    var extensn: String?            //Making typo, so that doesn't conflict with inbuilt keyword `extension`.
    
    var thumbURL: URL? {
        guard let path = self.path,
            let extensn = self.extensn else { return nil }
        
        let stringURL = (path + "." + extensn).addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)
        return URL(string: stringURL)
    }
}

extension Thumbnail: Initializer {
    
    init(with json: JSON) {
        self.extensn = json["extension"] as? String
        self.path = json["path"] as? String
    }
}
