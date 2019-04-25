//
//  Query.swift
//  craveBot
//
//  Created by David Kang on 4/24/19.
//  Copyright © 2019 CraveProject. All rights reserved.
//

import Foundation
import SwiftyJSON

class Query {
    var message: String?
    var location: String?
    var category: String?
    var price: String?
    
    // which question we are at (starts at zero)
    var curr: Int = 0
    
    init() {
        message = ""
        location = ""
        category = ""
        price = ""
    }

    func getJSONObject() -> JSON {
        let dict = getDictObject()
        return JSON(dict)
    }
    
    func getDictObject() -> [String: Any]{
        var locationString = location
        if ((locationString?.isEmpty)!){
            locationString = ""
        }
        var categoryString = category
        if ((categoryString?.isEmpty)!){
            categoryString = ""
        }
        var priceString = price
        if ((priceString?.isEmpty)!){
            priceString = ""
        }
        
        let dict = ["location" : locationString, "category": categoryString, "price": priceString, "message" : message] as [String: Any]
        return dict
    }
}
