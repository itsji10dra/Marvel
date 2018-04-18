//
//  CharactersListVC+PreviewingDelegate.swift
//  Marvel
//
//  Created by Jitendra on 19/04/18.
//  Copyright © 2018 Jitendra Gandhi. All rights reserved.
//

import Foundation

extension CharactersListVC: UIViewControllerPreviewingDelegate {
    
    func previewingContext(_ previewingContext: UIViewControllerPreviewing,
                           commit viewControllerToCommit: UIViewController) {
        
        navigationController?.pushViewController(viewControllerToCommit, animated: true)
    }
    
    func previewingContext(_ previewingContext: UIViewControllerPreviewing,
                           viewControllerForLocation location: CGPoint) -> UIViewController? {
        
        guard let indexPath = tableView.indexPathForRow(at: location) else { return nil }
        
        guard let detailsVC = Navigation.getViewController(type: CharactersDetailsVC.self,
                                                           identifer: "CharactersDetails") else { return nil }
        detailsVC.character = charactersArray[indexPath.row]
        
        return detailsVC
    }
}

