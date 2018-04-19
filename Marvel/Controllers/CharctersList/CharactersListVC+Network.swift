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
    func fetchCharacters(_ sender: Any?) {
        
        guard let url = URLManager.getURL(for: .publicCharacters,
                                          isAuthenticated: true,
                                          withLimitingParameters: true) else { return }
        
        if sender is UIRefreshControl == false {
            LoadingIndicator.startAnimating()
        }
        
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
                
                do {
                    let decoder = JSONDecoder()
                    decoder.dateDecodingStrategy = .iso8601
                    let response = try decoder.decode(Response<[Character]>.self, from: data)
                    
                    if response.code == 200 {
                        
                        guard let characters = response.data?.results else {
                            showError(ErrorMessage.unknownErrorMsg)
                            return
                        }
                        
                        self?.charactersArray = characters
                        
                        DispatchQueue.main.async {
                            self?.tableView.reloadData()
                        }
                    } else {
                        showError(ErrorMessage.unknownErrorMsg)
                    }
                } catch {
                    showError(ErrorMessage.dataParsingErrorMsg)
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
            self?.fetchCharacters(nil)
        }
        alertController.addAction(retryAction)
        
        present(alertController, animated: true, completion: nil)
    }
}
