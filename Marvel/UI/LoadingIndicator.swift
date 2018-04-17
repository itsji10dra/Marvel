//
//  LoadingIndicator.swift
//  Marvel
//
//  Created by Jitendra on 17/04/18.
//  Copyright © 2018 Jitendra Gandhi. All rights reserved.
//

import UIKit
import Foundation

struct LoadingIndicator {
    
    // MARK: Private
    
    private static let restorationIdentifier = "MarvelIndicator"
    
    private static var currentWindow: UIWindow? {
        return UIApplication.shared.keyWindow
    }
    
    // MARK: Public
    
    public static var textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    
    public static var messageFont = UIFont.systemFont(ofSize: 15)

    public static let backgroundColor = UIColor.black.withAlphaComponent(0.7)

    public static var defaultMessage = "Loading..."
    
    public static var isShowing: Bool {
        return currentWindow?.subviews.reversed().contains(where: { $0.restorationIdentifier == restorationIdentifier }) == true
    }
    
    public static func startAnimating(message: String? = defaultMessage) {
        
        guard isShowing == false,
            let keyWindow = currentWindow else { return }
        
        DispatchQueue.main.async {
            
            let view = UIView()
            view.backgroundColor = UIColor.clear
            view.frame = UIScreen.main.bounds
            view.restorationIdentifier = restorationIdentifier
            
            let dimView = UIView()
            dimView.backgroundColor = backgroundColor
            view.addSubview(dimView)
            dimView.translatesAutoresizingMaskIntoConstraints = false
            dimView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
            dimView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
            dimView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
            dimView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
            
            let holderStackView = UIStackView()
            holderStackView.axis = .vertical
            holderStackView.distribution = .fill
            holderStackView.alignment = .center
            holderStackView.spacing = 10
            view.addSubview(holderStackView)
            holderStackView.translatesAutoresizingMaskIntoConstraints = false
            holderStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
            holderStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0).isActive = true
            
            let loaderView = UIActivityIndicatorView(activityIndicatorStyle: .whiteLarge)
            loaderView.startAnimating()
            holderStackView.addArrangedSubview(loaderView)
            
            let label = UILabel()
            label.text = message
            label.textColor = textColor
            label.font = messageFont
            label.numberOfLines = 0
            label.textAlignment = .center
            holderStackView.addArrangedSubview(label)
            
            keyWindow.addSubview(view)
        }
    }
    
    public static func stopAnimating() {
        
        DispatchQueue.main.async {
            if let subViews = currentWindow?.subviews.reversed(),
                let loaderView = subViews.first(where: { $0.restorationIdentifier == restorationIdentifier }) {
                loaderView.removeFromSuperview()
            }
        }
    }
}
