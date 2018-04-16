//
//  Character.swift
//  Marvel
//
//  Created by Jitendra on 16/04/18.
//  Copyright © 2018 Jitendra Gandhi. All rights reserved.
//

import Foundation

struct Character {
    
    private(set) var id: Int64?
    
    var name: String?
    
    var description: String?
    
    var modified: Date?
    
    var thumbnail: Thumbnail?
    
    var resourceURI: URL?
    
    var comicsInfo: CollectionInfo<Comic>?
    
    var seriesInfo: CollectionInfo<Series>?

    var storiesInfo: CollectionInfo<Story>?

    var eventsInfo: CollectionInfo<Events>?
    
    var urls: [URLInfo]?
}

extension Character: Initializer {
    
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
