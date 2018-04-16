//
//  Configuration.swift
//  Marvel
//
//  Created by Jitendra on 16/04/18.
//  Copyright © 2018 Jitendra Gandhi. All rights reserved.
//

struct Configuration {
    
    static let url          = "http://gateway.marvel.com"
    
    static let apiKey       = "ff3d4847092294acc724123682af904b"
    
    static let hash         = "412b0d63f1d175474216fadfcc4e4fed"
    
    static func checkConfiguration() {
        
        if url.isEmpty || apiKey.isEmpty || hash.isEmpty {
            fatalError("""
                Invalid configuration found
            """)
        }
    }
}
