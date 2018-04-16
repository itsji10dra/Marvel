//
//  CharactersListVC.swift
//  Marvel
//
//  Created by Jitendra on 16/04/18.
//  Copyright © 2018 Jitendra Gandhi. All rights reserved.
//

import UIKit

class CharactersListVC: UIViewController, UITableViewDataSource, UITableViewDelegate {

    // MARK: - IBOutlets

    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Data
    
    lazy var charactersArray: [Character] = []
    
    var dataTask: URLSessionDataTask?

    // MARK: - View

    override func viewDidLoad() {
        super.viewDidLoad()

        fetchCharacters()
    }    
    
    // MARK: - UITableViewDataSource

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return charactersArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CharactersCell",
                                                       for: indexPath) as? CharactersCell else { return UITableViewCell() }
        
        let character = charactersArray[indexPath.row]
        
//        cell.thumbImageView.image =
        
        cell.nameLabel.text = character.name
        
        return cell
    }
    
    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let character = charactersArray[indexPath.row]
        pushDetailsScene(with: character)
    }

    // MARK: - Navigation
    
    private func pushDetailsScene(with character: Character) {
        
        guard let detailsVC = Navigation.getViewController(type: CharactersDetailsVC.self,
                                                           identifer: "CharactersDetails") else { return }
        detailsVC.character = character
        navigationController?.pushViewController(detailsVC, animated: true)
    }
}
