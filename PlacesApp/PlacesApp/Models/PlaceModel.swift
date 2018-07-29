//
//  PlaceModel.swift
//  PlacesApp
//
//  Created by Burhan on 28/07/2018.
//  Copyright © 2018 Burhan. All rights reserved.
//

import UIKit

class PlaceModel: NSObject {

}

class PlacesResponse: NSObject, Codable {
    
    var confident : Bool?
//    var geocode : String?
    var venues : [VenueModel]?
    
    
    override init() {
        super.init()
    }
}

class VenueModel: NSObject, Codable {
    
    var id : String?
    var categories : [CategoryModel]?
    var location : LocationModel?
    var name : String?
    var rating : Double?
    var bestPhoto : ImageModel?
    
    override init() {
        super.init()
    }
}

class LocationModel: NSObject, Codable {
    
    var address : String?
    var city : String?
    var state : String?
    var postalCode : String?
    var crossStreet : String?
    var country : String?
    var formattedAddress : [String]?
    var lat : Double?
    var lng : Double?
    
    var cc : String?
    
    
    override init() {
        super.init()
    }
}

class CategoryModel: NSObject, Codable {
    
    var id : String?
    var pluralName : String?
    var icon : ImageModel?
    var name : String?
    var shortName : String?
    var primary : Bool?
    
    override init() {
        super.init()
    }
}

class ImageModel: NSObject, Codable {
    
    var prefix : String? // "https://ss3.4sqi.net/img/categories_v2/parks_outdoors/playground_"
    var suffix : String? // ".png"
    
    override init() {
        super.init()
    }
}

class MetaModel: NSObject, Codable {
    
    var requestId : String?
    var code : Int?
    
    override init() {
        super.init()
    }
}

class PlacesOuterResponse: NSObject, Codable {
    
    var meta : MetaModel?
    var response : PlacesResponse?
    
    
    override init() {
        super.init()
    }
}

class VenueDetailResponse: NSObject, Codable {
    
    var venue : VenueModel?
    
    
    override init() {
        super.init()
    }
}

class VenueDetailOuterResponse: NSObject, Codable {
    
    var meta : MetaModel?
    var response : VenueDetailResponse?
    
    
    override init() {
        super.init()
    }
}
