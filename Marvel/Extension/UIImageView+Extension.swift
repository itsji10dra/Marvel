//
//  UIImageView+Extension.swift
//  Marvel
//
//  Created by Jitendra on 17/04/18.
//  Copyright © 2018 Jitendra Gandhi. All rights reserved.
//

import UIKit
import Foundation

private var kURLKey: Void?

extension UIImageView {
    
    public var imageURL: URL? {
        set { objc_setAssociatedObject(self, &kURLKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC) }
        get { return objc_getAssociatedObject(self, &kURLKey) as? URL }
    }
    
    func setImage(with url: URL) {
        
        self.imageURL = url
        self.image = nil

        ImageDownloadCachingManager.shared.downloadAndCacheImage(with: url) { [weak self] (image, url) in
            
            DispatchQueue.main.async {
                
                guard let strongSelf = self,
                    url == strongSelf.imageURL else {
                    return
                }

                strongSelf.image = image
            }
        }
    }
}
