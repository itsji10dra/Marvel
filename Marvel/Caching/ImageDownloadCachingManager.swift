//
//  ImageDownloadCachingManager.swift
//  Marvel
//
//  Created by Jitendra on 18/04/18.
//  Copyright © 2018 Jitendra Gandhi. All rights reserved.
//

import UIKit
import Foundation

class ImageDownloadCachingManager {
    
    // MARK: - Data
    
    static let shared = ImageDownloadCachingManager()
    
    var cache: ImageCache

    var downloader: ImageDownloader

    // MARK: - Initializer

    convenience init() {
        self.init(downloader: .shared, cache: .shared)
    }

    init(downloader: ImageDownloader, cache: ImageCache) {
        self.downloader = downloader
        self.cache = cache
    }
    
    // MARK: - Public Methods

    @discardableResult
    public func downloadAndCacheImage(with url: URL,
                                      completionHandler: ((UIImage, URL) -> Void)? = nil) -> URLSessionDataTask? {
        
        let key = url.absoluteString

        if let image = cache.retrieve(forKey: key) {
            completionHandler?(image, url)
            return nil
        }

        return downloader.downloadImage(with: url,
                                        completionHandler: { [weak self] (image, _) in
                
            if let image = image {
                self?.cache.store(image, forKey: key)
                completionHandler?(image, url)
            }
        })
    }
}
