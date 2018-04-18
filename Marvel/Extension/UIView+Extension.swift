//
//  UIView+Extension.swift
//  Marvel
//
//  Created by Jitendra on 18/04/18.
//  Copyright © 2018 Jitendra Gandhi. All rights reserved.
//

import UIKit

extension UIView {
    
    func loadView(fromNib nib: String) -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nib, bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil).first as? UIView
        return view ?? UIView()
    }

    @discardableResult
    func loadContentView() -> UIView {
        let nibName = type(of: self).description().components(separatedBy: ".").last ?? ""
        let contentView = loadView(fromNib: nibName)
        self.addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
        contentView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
        contentView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        contentView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
        return contentView
    }
}
