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


//to do for jennifer, do the restaurant by the end of the week
//ask david if he wants to do what, eg maybe the animating parts in the beginning? or other extra features 
//help howie with front screen and have him fill in some other parts of the networking using my parts as an example
class RestaurantViewController: UIViewController, KolodaViewDelegate, KolodaViewDataSource {
    var restaurantList: [Restaurant] = []
    var currentRestaurant: Restaurant! = nil
    
    @IBOutlet weak var kolodaView: KolodaView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        kolodaView.dataSource = self
        kolodaView.delegate = self
        
    }

    
    
    @IBAction func leftButtonTapped() {
        kolodaView?.swipe(.left)
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
        currentRestaurant = restaurantList[index]
        
        if (currentRestaurant != nil) {
            print(currentRestaurant!)
            print(currentRestaurant.imageURL!)
        }
        let url = URL(string: currentRestaurant.imageURL!)
        v.image.kf.setImage(with: url)
        v.address.text =  currentRestaurant.address!
        v.distance.text  = String(currentRestaurant.distance!) + " away"
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
        
        return v
        
    }
    
    
    
    /*func koloda(_ koloda: KolodaView, viewForCardOverlayAt index: Int) -> OverlayView? {
        return Bundle.main.loadNibNamed("OverlayView", owner: self, options: nil)![0] as? OverlayView
    }*/

}

