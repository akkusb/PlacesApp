//
//  SearchModel.swift
//  PlacesApp
//
//  Created by Burhan on 28/07/2018.
//  Copyright © 2018 Burhan. All rights reserved.
//

import UIKit

class SearchModel: NSObject {
    
    let clientId = "MHS4DHAMRY2Y2MN3IT11015CAMOTP5HZZR2T42DXJQOX0HRS"
    let clientSecret = "QLEZUVJRALSEZ3YRXIFOHOJJVQLSXQFM51MY2MEFBQ125WXV"
    
    let defaultQuery : String = "İstanbul"
    var query : String = "İstanbul"
    
    var venues : [VenueModel]?
    
    func search(success: @escaping (_ placesResponse: PlacesResponse?) -> Void, failure: @escaping (_ errorModel:ErrorModel?) -> Void) {
        self.search(queryString: self.query, success: success, failure: failure)
    }

    func search(queryString: String?, success: @escaping (_ placesResponse: PlacesResponse?) -> Void, failure: @escaping (_ errorModel:ErrorModel?) -> Void) {
        self.query = queryString ?? self.defaultQuery
        if self.query.isEmpty {
            self.query = self.defaultQuery
        }
        let parameter: [String: String] = [
            //            "ll": "35.702069,139.7753269",
            "near": self.query,
            "limit": "10",
            ];
        
        let client = FoursquareAPIClient(clientId: clientId, clientSecret: clientSecret)
        
        client.request(path: "venues/search", parameter: parameter) { result in
            switch result {
            case let .success(data):
                let decoder : JSONDecoder = JSONDecoder()
                do{
                    let placesOuterResponse : PlacesOuterResponse = try decoder.decode(PlacesOuterResponse.self, from: data)
                    
                    if let placesResponse : PlacesResponse = placesOuterResponse.response
                    {
                        self.venues = placesResponse.venues
                        
                        self.getAllVenueDetails(success: {
                            success(placesResponse)
                        })
                        
//                        success(placesResponse)
                    }else
                    {
                        failure(ErrorModel())
                    }
                }
                catch{
                    failure(ErrorModel())
                }
                
                
//                // parse the JSON data with NSJSONSerialization or Lib like SwiftyJson
//                // e.g. {"meta":{"code":200},"notifications":[{"...
//                let json = try! JSONSerialization.jsonObject(with: data, options: [])
//                print(json)
            case let .failure(error):
                
                failure(ErrorModel.init(description: error.localizedDescription))
                
                // Error handling
//                switch error {
//                case let .connectionError(connectionError):
//                    print(connectionError)
//                case let .responseParseError(responseParseError):
//                    print(responseParseError)   // e.g. JSON text did not start with array or object and option to allow fragments not set.
//                case let .apiError(apiError):
//                    print(apiError.errorType)   // e.g. endpoint_error
//                    print(apiError.errorDetail) // e.g. The requested path does not exist.
//                }
            }
        }
        
        
    }
    
    func getVenueDetails(venue:VenueModel, success: @escaping (_ venueDetailResponse: VenueDetailResponse?) -> Void, failure: @escaping (_ errorModel:ErrorModel?) -> Void)  {
        if let venueId = venue.id{
            let parameter: [String: String] = [:];
            
            let client = FoursquareAPIClient(clientId: clientId, clientSecret: clientSecret)
            
            client.request(path: "venues/\(venueId)", parameter: parameter, completion: { result in
                switch result {
                case let .success(data):
                    let decoder : JSONDecoder = JSONDecoder()
                    do{
                        let venueDetailOuterResponse : VenueDetailOuterResponse = try decoder.decode(VenueDetailOuterResponse.self, from: data)
                        
                        if let venueDetailResponse : VenueDetailResponse = venueDetailOuterResponse.response
                        {
                            
                            success(venueDetailResponse)
                        }else
                        {
                            failure(ErrorModel())
                        }
                    }
                    catch{
                        failure(ErrorModel())
                    }

                case let .failure(error):
                    
                    failure(ErrorModel.init(description: error.localizedDescription))
                }
            })
            
        }
        else{
            failure(ErrorModel())
        }
    }
    
    func getAllVenueDetails(success: @escaping () -> Void)  {
        if let venues = self.venues{
            let dispatchGroup = DispatchGroup()
            for venue : VenueModel in venues {
                dispatchGroup.enter()
                self.getVenueDetails(venue: venue, success: { (venueDetailResponse) in
                    dispatchGroup.leave()
                    venue.rating = venueDetailResponse?.venue?.rating
                    venue.bestPhoto = venueDetailResponse?.venue?.bestPhoto
                }, failure: { (err) in
                    dispatchGroup.leave()
//                    UIHelper.showError(error: err)
                    
                })
            }

            dispatchGroup.notify(queue: .main) {
                success()
            }
        }
        
    }
    
    
    
}
