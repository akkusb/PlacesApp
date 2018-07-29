//
//  SearchPlaceViewController.swift
//  PlacesApp
//
//  Created by Burhan on 28/07/2018.
//  Copyright © 2018 Burhan. All rights reserved.
//

import UIKit

class SearchPlaceViewController: BaseViewController {

    @IBOutlet weak var searchTextField: UITextField!
    
    @IBOutlet weak var searchContainerCenterYConstraint: NSLayoutConstraint!
    
    override func initialize() {
        
        self.title = "Anasayfa"
        let topBarHeight = UIApplication.shared.statusBarFrame.size.height + (self.navigationController?.navigationBar.frame.height ?? 0.0)
        self.searchContainerCenterYConstraint.constant = -topBarHeight/2
    }
    
    @IBAction func searchButtonAction(_ sender: Any) {
        
        let placeListViewController = PlaceListViewController()
        if let query = self.searchTextField.text{
            placeListViewController.searchModel.query = query
        }
        self.navigationController?.pushViewController(placeListViewController, animated: true)
    }
    
}
