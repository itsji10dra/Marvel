//
//  ImageCache.swift
//  Marvel
//
//  Created by Jitendra on 17/04/18.
//  Copyright © 2018 Jitendra Gandhi. All rights reserved.
//

import UIKit
import Foundation

class ImageCache {
    
    public static let shared = ImageCache(name: "shared")

    private let memoryCache = NSCache<NSString, UIImage>()

    var maxMemoryCost: UInt = 0 {
        didSet {
            self.memoryCache.totalCostLimit = Int(maxMemoryCost)
        }
    }
        
    private let imageCost: ((UIImage) -> Int) = { image in
        return Int(image.size.height * image.size.width * image.scale)
    }

    // MARK: - Initializer
    
    public init(name: String) {
        
        let cacheName = "com.itsji10dra.Marvel.\(name)"
        memoryCache.name = cacheName

        NotificationCenter.default.addObserver(self,
                                               selector: #selector(clearMemoryCache),
                                               name: .UIApplicationDidReceiveMemoryWarning,
                                               object: nil)
    }

    // MARK: - DeInitializer

    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    // MARK: - Public Methods

    public func store(_ image: UIImage,
                      forKey key: String,
                      completionHandler: (() -> Void)? = nil) {
        
        memoryCache.setObject(image, forKey: key as NSString, cost: imageCost(image))
                
        if let handler = completionHandler {
            DispatchQueue.main.async {
                handler()
            }
        }
    }
    
    public func removeImage(forKey key: String,
                            completionHandler: (() -> Void)? = nil) {
        
        memoryCache.removeObject(forKey: key as NSString)
        
        if let handler = completionHandler {
            DispatchQueue.main.async {
                handler()
            }
        }
    }
    
    public func retrieve(forKey key: String) -> UIImage? {
        
        return memoryCache.object(forKey: key as NSString)
    }
        
    @objc
    public func clearMemoryCache() {
        memoryCache.removeAllObjects()
    }
}
