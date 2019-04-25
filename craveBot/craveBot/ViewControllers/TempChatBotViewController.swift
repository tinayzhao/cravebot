//
//  TempChatBotViewController.swift
//  craveBot
//
//  Created by David Kang on 4/19/19.
//  Copyright © 2019 CraveProject. All rights reserved.
//

import Foundation
import UIKit
import CLTypingLabel
import Lottie
import CoreLocation

class TempChatBotViewController: UIViewController, CLLocationManagerDelegate {
    
    var chefAnimation: AnimationView?
    
    @IBOutlet var craveBotText: CLTypingLabel!
    @IBOutlet var input: UITextField!
    @IBOutlet var sendButton: UIButton!
    
    let manager = CLLocationManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // sets up location manager
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
        
        let userLocation: CLLocation? = manager.location
        
        if (userLocation != nil) {
            CLGeocoder().reverseGeocodeLocation(userLocation!) { (CLPlacemark, error) in
                if error != nil {
                    print ("Error <line 40>")
                } else {
                    if let place = CLPlacemark?[0] {
                        let city = place.locality!
                        let state = place.administrativeArea!
                        self.input.text = city + ", " + state
                    }
                }
            }
        }
        
        // sets text speed
        craveBotText.charInterval = 0.05
        
        // place the chef icon in the middle of the view
        chefAnimation = AnimationView(name: "chefSpeaks")
        chefAnimation?.frame = CGRect.init(x: 0, y: 0, width: self.view.frame.width * 2, height: self.view.frame.height * 2)
        chefAnimation?.center = self.view.center
        chefAnimation?.isUserInteractionEnabled = false
        self.view.addSubview(chefAnimation!)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
       
        // NOT CORRECT IMPLEMENTATION!!! but makes animation loop 3 times
        chefAnimation?.play { (finished) in
            self.chefAnimation?.play() {(finished) in self.chefAnimation?.play()}
        }
        
        craveBotText.text = "Hi there! I'm Cravebot\n Where would you like\nto eat today?"
    }
    
    
    @IBAction func sendToBot(_ sender: Any) {
        
        // NOT CORRECT IMPLEMENTATION!!! but makes animation loop 3 times
        chefAnimation?.play { (finished) in
            self.chefAnimation?.play() {(finished) in self.chefAnimation?.play()}
        }
        
        input.text = ""
        craveBotText.text = "Okay! Where would you \n like to eat today?"
    
    }
    
    
    
    
}


