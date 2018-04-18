//
//  CharactersListVC+Network.swift
//  Marvel
//
//  Created by Jitendra on 16/04/18.
//  Copyright © 2018 Jitendra Gandhi. All rights reserved.
//

import UIKit
import Foundation

extension CharactersListVC {
    
    @objc
    func fetchCharacters() {
        
        guard let url = URLManager.getURL(for: .publicCharacters,
                                          isAuthenticated: true,
                                          withLimitingParameters: true) else { return }
        
        LoadingIndicator.startAnimating()
        
        dataTask?.cancel()
        
        dataTask = URLSession.shared.dataTask(with: url) { [weak self] (data, _, error) in
            
            let showError: ((String) -> Void) = { message in
                DispatchQueue.main.async {
                    self?.showErrorAlert(with: message)
                }
            }
            
            defer {
                LoadingIndicator.stopAnimating()
                DispatchQueue.main.async {
                    self?.tableView.refreshControl?.endRefreshing()
                }
            }
            
            if error == nil,
                let data = data {

                let jsonObject = try? JSONSerialization.jsonObject(with: data, options: .mutableContainers)
                
                guard let json = jsonObject as? JSON else {
                    showError(ErrorMessage.dataParsingErrorMsg)
                    return
                }
                
                let response = Response<Character>.init(with: json)
                
                if response.code == 200 {
                    
                    guard let charactersArray = response.data?.results else { return }
                    
                    self?.charactersArray = charactersArray
                    
                    DispatchQueue.main.async {
                        self?.tableView.reloadData()
                    }
                } else {
                    showError(ErrorMessage.unknownErrorMsg)
                }
            } else {
               showError(error?.localizedDescription ?? ErrorMessage.unknownErrorMsg)
            }
        }
        
        dataTask?.resume()
    }
    
    // MARK: - Private Methods

    private func showErrorAlert(with message: String) {
        
        let alertController = UIAlertController(title: "Error",
                                                message: message,
                                                preferredStyle: .alert)
        
        let retryAction = UIAlertAction(title: "Retry", style: .default) { [weak self] _ in
            self?.fetchCharacters()
        }
        alertController.addAction(retryAction)
        
        present(alertController, animated: true, completion: nil)
    }
}
