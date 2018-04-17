//
//  UIImageView+Extension.swift
//  Marvel
//
//  Created by Jitendra on 17/04/18.
//  Copyright © 2018 Jitendra Gandhi. All rights reserved.
//

import UIKit
import Foundation

extension UIImageView {
    
    func setImage(with url: URL) {
        
        ImageDownloadCachingManager.shared.downloadAndCacheImage(with: url) { [weak self] image in
            DispatchQueue.main.async {
                self?.image = image
            }
        }
    }
}
