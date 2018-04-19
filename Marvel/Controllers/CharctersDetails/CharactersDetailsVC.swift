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
    
    @IBOutlet weak var detailsStackView: UIStackView!

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
        
        guard character?.urls?.first(where: { $0.type == .detail })?.url == nil else { return }
        
        bottomView.removeFromSuperview()
    }
    
    private func loadCharacterDetails() {
        
        guard let character = character else { return }
        
        title = character.name

        //Image
        if let imageURL = character.thumbnail?.thumbURL {
            thumbImageView.setImage(with: imageURL)
        }
        
        //CharacterDetailView
        let detailView: ((String, String) -> CharacterDetailView) = { title, description in
            let view = CharacterDetailView()
            view.customise(with: title, description: description)
            return view
        }
        
        //Description
        let nameView = detailView("Name", character.name ?? "")
        detailsStackView.addArrangedSubview(nameView)
        
        let hasDescription = character.description?.isEmpty != true
        let descriptionText = hasDescription ? character.description! : "There is no description for this character."

        let descriptionView = detailView("Description", descriptionText)
        detailsStackView.addArrangedSubview(descriptionView)

        //ExpandableCharacterDetailView
        let expandableView: ((String, [String]) -> ExpandableCharacterDetailView) = { title, details in
            let detailView = ExpandableCharacterDetailView()
            detailView.customise(with: title, detailsArray: details)
            return detailView
        }
        
        //Comics
        if let comicsNameArray = character.comics?.items?.compactMap({ $0.name }),
            comicsNameArray.isEmpty == false {
            let view = expandableView("Comics", comicsNameArray)
            detailsStackView.addArrangedSubview(view)
        }
        
        //Series
        if let seriesNameArray = character.series?.items?.compactMap({ $0.name }),
            seriesNameArray.isEmpty == false  {
            let view = expandableView("Series", seriesNameArray)
            detailsStackView.addArrangedSubview(view)
        }

        //Stories
        if let storiesNameArray = character.stories?.items?.compactMap({ $0.name }),
            storiesNameArray.isEmpty == false  {
            let view = expandableView("Stories", storiesNameArray)
            detailsStackView.addArrangedSubview(view)
        }

        //Events
        if let eventsNameArray = character.events?.items?.compactMap({ $0.name }),
            eventsNameArray.isEmpty == false  {
            let view = expandableView("Events", eventsNameArray)
            detailsStackView.addArrangedSubview(view)
        }
    }
    
    // MARK: - Action
    
    @IBAction func showMoreDetailsAction(_ sender: Any) {
        
        guard let url = character?.urls?.first(where: { $0.type == .detail })?.url else { return }

        let safariVC = SFSafariViewController(url: url)
        navigationController?.present(safariVC, animated: true, completion: nil)
    }
}
