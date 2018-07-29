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
    
    override func initialize() {
        self.title = "Anasayfa"
    }
    
    @IBAction func searchButtonAction(_ sender: Any) {

        
        let placeListViewController = PlaceListViewController()
        if let query = self.searchTextField.text{
            placeListViewController.searchModel.query = query
        }
        self.navigationController?.pushViewController(placeListViewController, animated: true)

//        let searchModel = SearchModel()
//        searchModel.search(queryString: self.searchTextField.text, success: { (placesResponse) in
//            print("")
//        }) { (err) in
//
//        }
        
    }
    
}
