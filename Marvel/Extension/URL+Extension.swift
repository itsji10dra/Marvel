//
//  URL+Extension.swift
//  Marvel
//
//  Created by Jitendra on 16/04/18.
//  Copyright © 2018 Jitendra Gandhi. All rights reserved.
//

import Foundation

extension URL {
    
    init?(string: String?) {
        guard let string = string else { return nil }
        self.init(string: string)
    }
}
