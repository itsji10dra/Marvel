//
//  CharactersListVC+Network.swift
//  Marvel
//
//  Created by Jitendra on 16/04/18.
//  Copyright © 2018 Jitendra Gandhi. All rights reserved.
//

import Foundation

extension CharactersListVC {
    
    func fetchCharacters() {
        
        guard let url = URLManager.getURL(for: .publicCharacters, isAuthenticated: true, withLimitingParameters: true) else { return }
        
        dataTask?.cancel()
        
        dataTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            guard let json = try? JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? JSON else { return }

            let response = Response<Character>.init(with: json!)
            
            print(response)
        }
        
        dataTask?.resume()
    }
}
