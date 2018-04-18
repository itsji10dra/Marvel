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
    
    static let shared = ImageDownloadCachingManager()
    
    var cache: ImageCache

    var downloader: ImageDownloader

    convenience init() {
        self.init(downloader: .shared, cache: .shared)
    }

    init(downloader: ImageDownloader, cache: ImageCache) {
        self.downloader = downloader
        self.cache = cache
    }
    
    @discardableResult
    func downloadAndCacheImage(with url: URL,
                               completionHandler: @escaping ((UIImage, URL) -> Void)) -> URLSessionDataTask? {
        
        let key = url.absoluteString

        if let image = cache.retrieve(forKey: key) {
            completionHandler(image, url)
            return nil
        }

        return downloader.downloadImage(with: url,
                                        completionHandler: { [weak self] (image, _) in
                
            if let image = image {
                self?.cache.store(image, forKey: key)
                completionHandler(image, url)
            }
        })
    }
}
