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
