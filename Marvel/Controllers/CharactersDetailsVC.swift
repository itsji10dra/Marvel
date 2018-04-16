//
//  CharactersDetailsVC.swift
//  Marvel
//
//  Created by Jitendra on 16/04/18.
//  Copyright © 2018 Jitendra Gandhi. All rights reserved.
//

import UIKit
import SafariServices

class CharactersDetailsVC: UIViewController {

    // MARK: - IBOutlets

    @IBOutlet weak var thumbImageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!

    @IBOutlet weak var bottomView: UIView!

    // MARK: - Data

    var character: Character?
    
    // MARK: - View

    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
        
        loadCharacterDetails()
    }
    
    // MARK: - Private

    private func configureUI() {
        
        guard character?.urls?.first(where: { $0.type == .details })?.url == nil else { return }
        
        bottomView.removeFromSuperview()
    }
    
    private func loadCharacterDetails() {
        
        guard let character = character else { return }
        
        title = character.name
        
        nameLabel.text = character.name
        
        let hasDescription = character.description?.isEmpty != true
        descriptionLabel.text = hasDescription ? character.description : "There is no description for this character."
        
        if let imageURL = character.thumbnail?.thumbURL,
            let data = try? Data(contentsOf: imageURL) {
            thumbImageView.image = UIImage(data: data)
        }
    }
    
    // MARK: - Action
    
    @IBAction func showMoreDetailsAction(_ sender: Any) {
        
        guard let url = character?.urls?.first(where: { $0.type == .details })?.url else { return }

        let safariVC = SFSafariViewController(url: url)
        navigationController?.present(safariVC, animated: true, completion: nil)
    }
}
