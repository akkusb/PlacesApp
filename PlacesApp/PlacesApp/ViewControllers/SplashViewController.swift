//
//  SplashViewController.swift
//  PlacesApp
//
//  Created by Burhan on 28/07/2018.
//  Copyright © 2018 Burhan. All rights reserved.
//

import UIKit

class SplashViewController: BaseViewController {

    override func viewDidAppear(_ animated: Bool) {
        
        super.viewDidAppear(animated)
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+2) {
            self.navigateToSearchPlaceViewController()
        }
    }
    
    func navigateToSearchPlaceViewController() {
        
        let searchPlaceViewController = SearchPlaceViewController()
        let searchPlaceNavigationController = UINavigationController.init(rootViewController: searchPlaceViewController)
        UIApplication.shared.keyWindow?.rootViewController = searchPlaceNavigationController
    }

}
