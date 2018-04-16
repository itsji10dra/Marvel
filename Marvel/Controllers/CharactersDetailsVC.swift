//
//  CharactersDetailsVC.swift
//  Marvel
//
//  Created by Jitendra on 16/04/18.
//  Copyright © 2018 Jitendra Gandhi. All rights reserved.
//

import UIKit

class CharactersDetailsVC: UIViewController {

    // MARK: - IBOutlets

    
    // MARK: - Data

    var character: Character?
    
    // MARK: - View

    override func viewDidLoad() {
        super.viewDidLoad()

        title = character?.name
    }
}
