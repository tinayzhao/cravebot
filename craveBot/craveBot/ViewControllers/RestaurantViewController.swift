//
//  RestaurantViewController.swift
//  craveBot
//
//  Created by Jennifer Xiao on 4/13/19.
//  Copyright © 2019 CraveProject. All rights reserved.
//

import Foundation
import UIKit
import Koloda
import Kingfisher
import FloatRatingView


class RestaurantViewController: UIViewController, KolodaViewDelegate, KolodaViewDataSource {
    var restaurantList: [Restaurant] = []
    var currentRestaurant: Restaurant! = nil
    
    
    @IBOutlet weak var kolodaView: KolodaView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        kolodaView.dataSource = self
        kolodaView.delegate = self
        
        // swipe gesture recognizer setup
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(swipeAction(swipe:)))
        rightSwipe.direction = UISwipeGestureRecognizer.Direction.right
        self.view.addGestureRecognizer(rightSwipe)
        kolodaView.cornerRadius(radius: 20)
        kolodaView.addShadow()
        kolodaView.addShadowOnBottom()
        
    }

    //JENNIFER: Link addy to respective restaurant
    @IBAction func mapsButtonTapped() {
        let v = CardView.instanceFromNib()
        let addy = "http://maps.apple.com/?address=" + v.address.text!
        UIApplication.shared.open(URL(string: addy)!, options: [:], completionHandler: nil)
    }
    
    
    @IBAction func leftButtonTapped() {
        //kolodaView?.swipe(.left)
        kolodaView?.revertAction()
    }
    
    @IBAction func rightButtonTapped() {
        kolodaView?.swipe(.right)
    }
    
    @IBAction func undoButtonTapped() {
        kolodaView?.revertAction()
    }
    
    
    func kolodaDidRunOutOfCards(_ koloda: KolodaView) {
        //TODO: ????
        kolodaView.resetCurrentCardIndex()
    }
    
    func koloda(_ koloda: KolodaView, didSelectCardAt index: Int) {
        currentRestaurant = restaurantList[index]
    }
    
    func kolodaNumberOfCards(_ koloda:KolodaView) -> Int {
        return restaurantList.count
    }
    
    func kolodaSpeedThatCardShouldDrag(_ koloda: KolodaView) -> DragSpeed {
        return .fast
    }
    
    func koloda(_ koloda: KolodaView, viewForCardAt index: Int) -> UIView {
        
        let v = CardView.instanceFromNib()
        //v.cornerRadius(radius: 10)
        v.addShadow()
        
        currentRestaurant = restaurantList[index]
        
        if (currentRestaurant != nil) {
            print(currentRestaurant!)
            print(currentRestaurant.imageURL!)
        }
        let url = URL(string: currentRestaurant.imageURL!)
        v.image.kf.setImage(with: url)
        v.address.text =  currentRestaurant.address!
        v.distance.text  = String(currentRestaurant.distance!) + "mi away"
        v.hours.text = ""
        v.rating.maxRating = 5
        
        v.RestaurantName.text = currentRestaurant.name!

        v.rating.delegate = v
        v.rating.contentMode = UIView.ContentMode.scaleAspectFit
        v.rating.type = .halfRatings
        v.rating.rating = currentRestaurant.rating!
        v.rating.emptyImage = UIImage(named: "StarEmpty")
        v.rating.fullImage = UIImage(named: "StarFull")
        v.rating.editable = false
        
        if (currentRestaurant.open == true) {
            v.openStatus.text = "Open"
            v.openStatus.textColor = UIColor.green
        } else {
            v.openStatus.text = "Closed"
            v.openStatus.textColor = UIColor.red
        }
        print(currentRestaurant.cost!)
        v.dollarSigns.text = currentRestaurant.cost!
        
        
        return v
        
    }
    
    
    
    /*func koloda(_ koloda: KolodaView, viewForCardOverlayAt index: Int) -> OverlayView? {
        return Bundle.main.loadNibNamed("OverlayView", owner: self, options: nil)![0] as? OverlayView
    }*/

}

