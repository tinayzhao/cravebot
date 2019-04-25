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
    
    var query = Query()
    
    let manager = CLLocationManager()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // sets up location manager
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
        
        let userLocation: CLLocation? = manager.location
        
        // will set the input to be current location if Core Location is allowed
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
       
        chefwiggle()
        craveBotText.text = "Hi there! I'm Cravebot\n Where would you like\n to eat today?"
        
    }
    
    
    @IBAction func sendToBot(_ sender: Any) {
        
        // updateInfo()
        // send self.query to Yelp api via backend
        // clear user input
        
        // if (returned json is nil or has error message)
        
            // sayBadInput()
            // deleteInfo() updates self.query to reset that particular value to nil
            // askQuestion()
        
        // else:
        
            // askQuestion()
    }
    
    func updateInfo(_ currentQuestion: Int, _ newData: String) {
        if currentQuestion == 0 {
            query.location = newData
        } else if currentQuestion == 1 {
            query.type = newData
        } else if currentQuestion == 2 {
            query.price = newData
        }
        query.curr += 1
    }
    
    // for incorrect input / bad requests
    func deleteInfo(_ currentQuestion: Int) {
        if currentQuestion == 0 {
            query.location = nil
        } else if currentQuestion == 1 {
            query.type = nil
        } else if currentQuestion == 2 {
            query.price = nil
        }
        query.curr -= 1
    }
    
    
    func askQuestion(_ n: Int) {
        if n == 0 {
            craveBotText.text = "Okay! Where would you \n like to eat today?"
        } else if n == 1 {
            craveBotText.text = "What kind of food \n are you craving?"
        } else if n == 2 {
            craveBotText.text = "How much are you \n looking to spend?"
        }
    }
    
    func sayBadInput() {
        craveBotText.text = "Sorry, I don't understand."
    }
    
    
    // Not Ideal Implementation! but makes animation loop 3 times
    func chefwiggle() {
        chefAnimation?.play { (finished) in
            self.chefAnimation?.play() {(finished) in self.chefAnimation?.play()}
        }
        
    }
    
    
    
    
}


