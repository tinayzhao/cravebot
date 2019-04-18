//
//  CardView.swift
//  craveBot
//
//  Created by Jennifer Xiao on 4/16/19.
//  Copyright © 2019 CraveProject. All rights reserved.
//

import Foundation
import FloatRatingView

import UIKit
/Users/jenniferxiao/CraveProject/cravebot/craveBot/craveBot/ViewControllers/ChatBotViewController.swift
class CardView: UIView {
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var RestaurantName: UILabel!
    @IBOutlet weak var rating: FloatRatingView!
    @IBOutlet weak var address: UILabel!
    @IBOutlet weak var distance: UILabel!
    @IBOutlet weak var hours: UILabel!
    @IBOutlet weak var cost: UILabel!
    @IBOutlet weak var openStatus: UILabel!
    
    var restaurant: Restaurant!
    
    class func instanceFromNib() -> CardView {
        
        return UINib(nibName: "CardView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! CardView
    }
}
