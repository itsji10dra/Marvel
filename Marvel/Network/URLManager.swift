//
//  URLManager.swift
//  Marvel
//
//  Created by Jitendra on 16/04/18.
//  Copyright © 2018 Jitendra Gandhi. All rights reserved.
//

import Foundation

struct URLManager {
    
    // MARK: - Public

    static func getURL(for resource: EndPoint, isAuthenticated: Bool, withLimitingParameters: Bool = false) -> URL? {
        
        let endPoint = resource.rawValue
        var urlComponents = URLComponents(string: Configuration.url + endPoint)
        
        let convertItems: (([String:String]) -> [URLQueryItem]) = { parameters in
            return parameters.map { return URLQueryItem(name: $0, value: $1) }
        }
        
        var queryItems: [URLQueryItem] = []
        
        if isAuthenticated {
            let parameters = getAuthenticationParameters()
            queryItems.append(contentsOf: convertItems(parameters))
        }
        
        if withLimitingParameters {
            let parameters = getLimitingParameters()
            queryItems.append(contentsOf: convertItems(parameters))
        }
        
        urlComponents?.queryItems = queryItems
        
        return urlComponents?.url
    }
    
    // MARK: - Private
    
    static private func getAuthenticationParameters() -> [String:String] {
        return ["apikey"    : Configuration.apiKey,
                "hash"      : Configuration.hash]
    }

    static private func getLimitingParameters() -> [String:String] {
        return ["ts"        : "1",
                "limit"     : "25",
                "orderBy"   : "-modified"]
    }
}
