//
//  UIViewController+Extension.swift
//  Marvel
//
//  Created by Jitendra on 19/04/18.
//  Copyright © 2018 Jitendra Gandhi. All rights reserved.
//

import UIKit

extension UIViewController {
    
    var isForceTouchEnabled: Bool {
        return traitCollection.forceTouchCapability == .available
    }
}

