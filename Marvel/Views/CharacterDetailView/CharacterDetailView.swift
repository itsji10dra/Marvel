//
//  CharacterDetailView.swift
//  Marvel
//
//  Created by Jitendra on 18/04/18.
//  Copyright © 2018 Jitendra Gandhi. All rights reserved.
//

import UIKit

class CharacterDetailView: UIView {

    // MARK: - IBOutlet

    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    // MARK: - View
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setup()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
    // MARK: - Private Methods
    
    private func setup() {
        loadContentView()
    }
    
    // MARK: - Customise
    
    internal func customise(with title: String, description: String) {
        
        nameLabel.text = title
        descriptionLabel.text = description
    }
}
