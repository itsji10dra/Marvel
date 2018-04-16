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
        
        if let thumbnailJSON = json["thumbnail"] as? JSON {
            self.thumbnail = Thumbnail.init(with: thumbnailJSON)
        } else {
            self.thumbnail = nil
        }
        
        self.resourceURI = URL(string: json["resourceURI"] as? String)
        
        self.comicsInfo = nil
        self.seriesInfo = nil
        self.storiesInfo = nil
        self.eventsInfo = nil

        if let urlJSONArray = json["urls"] as? [JSON] {
            self.urls = urlJSONArray.compactMap { URLInfo.init(with: $0) }
        } else {
            self.urls = nil
        }
    }
}
