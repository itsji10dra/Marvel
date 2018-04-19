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
    
    enum Keys: String, CodingKey {
        case rawValue
    }
    
    init(from decoder: Decoder) {
        do {
            let container = try decoder.container(keyedBy: Keys.self)
            let rawValue = try container.decode(String.self, forKey: .rawValue)
            self = StoryType(rawValue: rawValue) ?? .unknown
        } catch {
            self = .unknown
        }
    }
}

