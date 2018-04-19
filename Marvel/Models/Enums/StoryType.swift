//
//  StoryType.swift
//  Marvel
//
//  Created by Jitendra on 16/04/18.
//  Copyright © 2018 Jitendra Gandhi. All rights reserved.
//

enum StoryType: String, Decodable {
    
    case unknown
    case cover
    case interiorStory
    
    init(from decoder: Decoder) throws {
        
        do {
            let container = try decoder.singleValueContainer()
            let value = try container.decode(String.self)
            self = StoryType.init(rawValue: value) ?? .unknown
        }
        catch {
            self = .unknown
        }
    }
}

