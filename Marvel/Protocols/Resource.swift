//
//  Resource.swift
//  Marvel
//
//  Created by Jitendra on 16/04/18.
//  Copyright © 2018 Jitendra Gandhi. All rights reserved.
//

import Foundation

protocol Resource {
    
    var resourceURI: URL? { get set }
    
    var name: String? { get set }
}
