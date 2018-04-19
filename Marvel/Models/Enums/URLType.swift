//
//  URLType.swift
//  Marvel
//
//  Created by Jitendra on 16/04/18.
//  Copyright © 2018 Jitendra Gandhi. All rights reserved.
//

enum URLType: String, Decodable {
    
    case unknown
    case detail
    case wiki
    case comiclink
    
    init(from decoder: Decoder) throws {
        
        do {
            let container = try decoder.singleValueContainer()
            let value = try container.decode(String.self)
            self = URLType.init(rawValue: value) ?? .unknown
        }
        catch {
            self = .unknown
        }
    }
}
