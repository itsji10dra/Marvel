//
//  ExpandableCharacterDetailView.swift
//  Marvel
//
//  Created by Jitendra on 18/04/18.
//  Copyright © 2018 Jitendra Gandhi. All rights reserved.
//

import UIKit

@IBDesignable
class ExpandableCharacterDetailView: UIView {

    // MARK: - IBOutlet

    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var detailsStackView: UIStackView!
    
    @IBOutlet weak var loadMoreButton: UIButton!
    
    @IBOutlet weak var footerView: UIView!
    
    // MARK: - Data
    
    private let bulletCharacter = "•"
    
    private let defaultNumberOfVisibleContent: Int = 3
    
    private var expandableViewsCount: Int {
        return detailsStackView.arrangedSubviews.count - defaultNumberOfVisibleContent
    }

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
    
    private func configureFooterView() {
        
        if expandableViewsCount > 0 {
            let title = "Show \(expandableViewsCount) more..."
            loadMoreButton.setTitle(title, for: .normal)
        } else {
            footerView.isHidden = true
        }
    }
    
    private func getDetailsView(with title: String) -> UILabel {
        
        let label = UILabel()
        label.text = " \(bulletCharacter) " + title
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }
    
    // MARK: - Customise
    
    internal func customise(with title: String, detailsArray: [String]) {
        
        titleLabel.text = title
        
        detailsArray.enumerated().forEach { index, value in
            
            let view = self.getDetailsView(with: value)
            view.isHidden = (index + 1) > defaultNumberOfVisibleContent
            self.detailsStackView.addArrangedSubview(view)
        }
        
        configureFooterView()
    }

    // MARK: - Action

    @IBAction func loadMoreAction(_ sender: Any) {
        
        UIView.animate(withDuration: 0.3) {
            self.detailsStackView.arrangedSubviews.forEach { $0.isHidden = false }
            self.footerView.isHidden = true
        }
    }
}
