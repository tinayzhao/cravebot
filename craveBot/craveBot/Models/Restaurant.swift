//
//  Restaurant.swift
//  craveBot
//
//  Created by Jennifer Xiao on 4/13/19.
//  Copyright © 2019 CraveProject. All rights reserved.
//
import SwiftyJSON
import Foundation
import UIKit

@objc class Restaurant: NSObject {
    private var json: JSON
    
    init(json: JSON) {
        //print(json)
        self.json = json
    }
    
    /*init(jsonObject: JSONObject) {
        self.json = JSON(jsonObject)
    }*/
    
    var name: String? {
        return self.json["name"].stringValue
    }
    
    var rating: Double? {
        return self.json["rating"].doubleValue
    }
    
    var address: String? {
        return self.json["location"]["address1"].stringValue + ", " + self.json["location"]["city"].stringValue
        
    }
    
    var imageURL: String? {
        //print(self.json["image_url"].stringValue)
        return self.json["image_url"].stringValue
    }
    
    var distance: Double? {
        return Double(round(100*self.json["distance"].doubleValue)/100)
    }
    
    var open: Bool? {
        //TODO:
        return self.json["is_open"].boolValue
    }
    
    var cost: String? {
        return self.json["cost"].stringValue
    }
    //hours?
    //
    
    var locationForMaps: String? {
        var address = self.json["location"]["address1"].stringValue
        var city = self.json["location"]["city"].stringValue
        address = address.replacingOccurrences(of: " ", with: "+", options: .literal, range: nil)
        var state = self.json["location"]["state"].stringValue
        return address + "," + city + "," + state
        //daddr=John+F.+Kennedy+International+Airport,+Van+Wyck+Expressway,+Jamaica,+New+York&directionsmode=transit
    }
    
}
