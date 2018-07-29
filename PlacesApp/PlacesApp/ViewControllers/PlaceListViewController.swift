
//
//  PlaceListViewController.swift
//  PlacesApp
//
//  Created by Burhan on 28/07/2018.
//  Copyright © 2018 Burhan. All rights reserved.
//

import UIKit

class PlaceListViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var searchModel : SearchModel = SearchModel()
    
    override func initialize() {
        
        self.title = "Mekanlar"
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(UINib.init(nibName: "PlaceTableViewCell", bundle: nil), forCellReuseIdentifier: "PlaceTableViewCell")
        
        self.loadData()
    }
    
    func loadData() {
        
        self.showHud()
        self.searchModel.search(success: { (placesResponse) in
            self.hideHud()
            self.tableView.reloadData()
        }) { (err) in
            self.hideHud()
            UIHelper.showError(error: err)
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlaceTableViewCell", for: indexPath) as! PlaceTableViewCell
        if let venues = self.searchModel.venues{
            let currentVenue = venues[indexPath.row]
            cell.refreshCellWithData(currentVenue)
        }
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let venues = self.searchModel.venues{
            let currentVenue = venues[indexPath.row]
            self.showDetailPopup(venue: currentVenue)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.searchModel.venues?.count ?? 0
    }
    
    
    func showDetailPopup(venue: VenueModel) {
        
        let placeDetailPopupViewController = PlaceDetailPopupViewController()
        placeDetailPopupViewController.venue = venue
        
        placeDetailPopupViewController.modalPresentationStyle = .overCurrentContext
        self.present(placeDetailPopupViewController, animated: true)
    }
}
