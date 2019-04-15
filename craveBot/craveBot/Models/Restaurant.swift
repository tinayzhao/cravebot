//
//  Restaurant.swift
//  craveBot
//
//  Created by Jennifer Xiao on 4/13/19.
//  Copyright © 2019 CraveProject. All rights reserved.
//
import SwiftyJSON

@objc class Restaurant: NSObject {
    private var json: JSON
    
    init(json: JSON) {
        self.json = json
    }
    
    init(jsonObject: JSONObject) {
        self.json = JSON(jsonObject)
    }
    
    var name: String? {
        return self.json["name"].stringValue
    }
    var rating: Double? {
        return self.json["rating"].doubleValue
    }
    
    var address: String? {
        return self.json["address"].stringValue
    }
    
    var imageURL: String? {
        return self.json["imageURL"].stringValue
    }
    
    var distance: Double? {
        return self.json["distance"].doubleValue
    }
    
    var open: Bool? {
        //TODO:
        return Bool(self.json["isOpen"].stringValue)
    }
    //hours?
    //
    
    
    
}
