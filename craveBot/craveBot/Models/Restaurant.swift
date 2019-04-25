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
        return Double(round(1000*self.json["distance"].doubleValue)/1000)
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
    
    
    
}
