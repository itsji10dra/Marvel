//
//  Character+Initializer.swift
//  Marvel
//
//  Created by Jitendra on 16/04/18.
//  Copyright © 2018 Jitendra Gandhi. All rights reserved.
//

import Foundation

extension Character where T: Initializer {
    
    init(with json: JSON) {
        self.id = json["id"] as? Int64
        self.name = json["name"] as? String
        self.description = json["description"] as? String
        self.modified = nil
        self.thumbnail = nil
        self.resourceURI = nil
        self.comicsInfo = nil
        self.seriesInfo = nil
        self.storiesInfo = nil
        self.eventsInfo = nil
        self.urls = nil
    }
}
