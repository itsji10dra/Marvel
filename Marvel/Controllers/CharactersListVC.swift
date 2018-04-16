//
//  CharactersListVC.swift
//  Marvel
//
//  Created by Jitendra on 16/04/18.
//  Copyright © 2018 Jitendra Gandhi. All rights reserved.
//

import UIKit

class CharactersListVC: UIViewController {

    // MARK: - IBOutlets

    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Data
    
    var dataTask: URLSessionDataTask?

    // MARK: - View

    override func viewDidLoad() {
        super.viewDidLoad()

        fetchCharacters()
    }
}
