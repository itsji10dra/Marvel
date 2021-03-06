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
private var kIndicatorKey: Void?

extension UIImageView {
    
    // MARK: - Private
    
    private var imageURL: URL? {
        set { objc_setAssociatedObject(self, &kURLKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC) }
        get { return objc_getAssociatedObject(self, &kURLKey) as? URL }
    }
    
    private var indicator: UIActivityIndicatorView? {
        get {
            guard let indicator = objc_getAssociatedObject(self, &kIndicatorKey) as? UIActivityIndicatorView else { return nil }
            return indicator
        }
        set {
            indicator?.removeFromSuperview()
            objc_setAssociatedObject(self, &kIndicatorKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    private func getActivityIndicator() -> UIActivityIndicatorView {
        
        if let indicator = indicator {
            return indicator
        } else {
            let indicator = UIActivityIndicatorView()
            indicator.activityIndicatorViewStyle = .gray
            indicator.center = CGPoint(x: self.bounds.midX, y: self.bounds.midY)
            self.addSubview(indicator)
            self.indicator = indicator
            return indicator
        }
    }
    
    // MARK: - Public
    
    public func setImage(with url: URL) {
        
        self.imageURL = url
        self.image = nil
        
        let spinningIndicator = getActivityIndicator()
        spinningIndicator.startAnimating()

        ImageDownloadCachingManager.shared.downloadAndCacheImage(with: url) { [weak self] (image, url) in
            
            DispatchQueue.main.async {
                
                spinningIndicator.stopAnimating()

                guard let strongSelf = self,
                    url == strongSelf.imageURL else {
                    return
                }
                
                strongSelf.image = image
            }
        }
    }
}
