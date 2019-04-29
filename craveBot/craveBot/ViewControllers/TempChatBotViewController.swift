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
import SwiftyJSON
import Alamofire
import Kingfisher
import IHKeyboardAvoiding

class TempChatBotViewController: UIViewController, CLLocationManagerDelegate,  UITextFieldDelegate {

    var chefAnimation: AnimationView?
    var currChefPersonality: Int = 0
    var chefPersonality = [0: "normie", 1: "sassy", 2: "edgelord"]
    
    var normie = [0: "Hi there! I'm Cravebot\n Where would you like\n to eat today?", 1: "Okay! Where would you \n like to eat today?", 2: "What kind of food \n are you craving?", 3: "How much are you \n looking to spend?", 4: "I found some restaurants! \n Swipe to take a look!"]
    
    var sassy = [0: "Hiya, ya gurl is called Cravebot, where ya wanna eat sis?", 1: "Hiiiiiii. So do you know where you want to eat or what?", 2: "What type of food do you want? \n Omg do I have to do everything for you...", 3: "So how’s the bank account lookin? \n How much do you wanna spend?", 4: "Girl, I found the spot for us. \n Swipe left to take a look :P"]
    var edgelord = [0: "Dude holla at your Cravebot. \n What's your addy tho? I'm tryin come through ;)", 1: "Yo\n Whatsup playa, wya?", 2: "Aight. \n So whatcha feeling fam?", 3: "Ooh boi its lit, \n so how many stacks are we trying to burn thru today", 4: "Ya yeet, we got you a match, \n and we wont ghost you like that tinder ho. Swipe to see ;)"]
    

    @IBOutlet weak var UserInputView: UIView!
    @IBOutlet var craveBotText: CLTypingLabel!
    @IBOutlet var input: UITextField!
    @IBOutlet var sendButton: UIButton!
    @IBOutlet var backgroundImage: UIImageView!
    
    var query = Query()
    var restaurantList: [Restaurant] = []

    let manager = CLLocationManager()

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        sendToBackend()
        return true
    }
    
    @IBAction func editingDidEnd(_ sender: Any) {
        sendToBackend()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //gesture recognizer setup

        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(swipeAction(swipe:)))
        leftSwipe.direction = UISwipeGestureRecognizer.Direction.left
        self.view.addGestureRecognizer(leftSwipe)


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
        chefAnimation = AnimationView(name: "chefgirl")
        let center = self.view.center
        chefAnimation?.frame = CGRect.init(x: -center.x - 20, y: -center.y - 150
            ,  width: self.view.frame.width * 2.1, height: self.view.frame.height * 2.1)
        chefAnimation?.isUserInteractionEnabled = false
        self.view.addSubview(chefAnimation!)

    

    }

    override func viewDidAppear(_ animated: Bool) {

        chefwiggle()
        //craveBotText.text = "Hi there! I'm Cravebot\n Where would you like\n to eat today?"
        self.askQuestion(self.query.curr)
        KeyboardAvoiding.avoidingView = UserInputView
        KeyboardAvoiding.paddingForCurrentAvoidingView = 5

    }

    @IBAction func tappedChef(_ sender: Any) {
        print("Tapped on Chefbot")
        currChefPersonality = (currChefPersonality + 1)%3
    }
    
    
    func sendToBackend() {
        let userInput = input.text
        query.message = userInput ?? ""             // query message updated
        updateInfo(self.query.curr, userInput!)     // query appropriate info updated as well as +1 to curr atrribute
        let json = query.getDictObject()
        print(json)
        //let postParameters = JSONSerialization.data(withJSONObject: json, options: .prettyPrinted)
        let url = "http://localhost:5000/api/backend"
        
        Alamofire.request(url, method: .post, parameters: json, encoding: JSONEncoding.default).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                //print("JSON: \(json)")
                
                let messageData = json["message"].stringValue
                if (messageData != "") {
                    print("message sent from backend: ")
                    print(messageData)
                    self.deleteInfo(self.query.curr)
                    self.sayBadInput(self.query.curr, message: messageData)       // simple message
                     // deletes appropriate info and -1 from curr attribute
                    // asks the appropriate question
                    //self.askQuestion(self.query.curr)
                    self.input.text = ""
                } else {
                    let resData = json["restaurants"]
                    //print (resData)
                    self.updateRestaurantList(resData)
                    self.input.text = ""
                    
                    // changes bg image
                    self.changeBackgroundImage()
                    self.askQuestion(self.query.curr)
                }
            case .failure(let error):
                print(".failure was entered")
                print(error)
                self.sayBadInput(self.query.curr)                      // simple message
                self.deleteInfo(self.query.curr)        // deletes appropriate info and -1 from curr attribute
                // asks the appropriate question
            }
        }
    }

    
    
    @IBAction func sendToBot(_ sender: Any) {
        sendToBackend()
    }
    
    // changes the background image with a cross dissolve transition
    func changeBackgroundImage() {
        if (restaurantList.count != 0){
            let url = URL(string: restaurantList[0].imageURL!)
            UIView.transition(with: self.backgroundImage, duration: 1, options: .transitionCrossDissolve, animations: {self.backgroundImage.kf.setImage(with: url)}, completion: nil)
        } else{
            if (self.query.curr == 1) {
                UIView.transition(with: self.backgroundImage, duration: 1, options: .transitionCrossDissolve, animations: {self.backgroundImage.image = UIImage(named: "salad")}, completion: nil)
            } else if (self.query.curr) == 2 {
                UIView.transition(with: self.backgroundImage, duration: 1, options: .transitionCrossDissolve, animations: {self.backgroundImage.image = UIImage(named: "burrito")}, completion: nil)
            }
        }
       
    }

    func updateRestaurantList(_ jsonData: JSON){
        //test: with preloaded json
        //let path = Bundle.main.path(forResource: "restaurant", ofType: "json")

        //print(path)
        //let jsonData = NSData(contentsOfFile:path!)
        //do {
        restaurantList = []
        let json = JSON(jsonData)
        //print(json)
        let jsonList = json.arrayValue
        for item in jsonList {
            let restarauntJSON = JSON(item)
            restaurantList.append(Restaurant(json: restarauntJSON))
            print(restarauntJSON["name"])
        }
        
        //print(restaurantList)
        print(restaurantList.count)
            // print("success")
        //}catch let error {
            //print(error.localizedDescription)
        //}
    }

    func updateInfo(_ currentQuestion: Int, _ newData: String) {
        if currentQuestion == 0 || currentQuestion == 1 {
            query.location = newData
        } else if currentQuestion == 2 {
            query.category = newData
        } else if currentQuestion == 3 {
            query.price = newData
        }
        query.curr += 1
        //print(self.questionNumber)
        //print(query.curr)

    }

    // for incorrect input / bad requests
    func deleteInfo(_ currentQuestion: Int) {
        if currentQuestion == 1 {
            query.location = ""
        } else if currentQuestion == 2 {
            query.category = ""
        } else if currentQuestion == 3 {
            query.price = ""
        }
        query.curr -= 1
        //self.askQuestion(self.query.curr)
    }
    
    


    func askQuestion(_ n: Int) {
        let personality = chefPersonality[currChefPersonality]
        var messageDict = normie
        if (personality == "sassy"){
            messageDict = sassy
        } else if (personality == "edgelord") {
            messageDict = edgelord
        }
        chefwiggle()
        if n == 0 {
            craveBotText.text = messageDict[0]
            query.curr += 1
        } else if n == 1 {
            craveBotText.text = messageDict[1]
        } else if n == 2 {
            craveBotText.text = messageDict[2]
        } else if n == 3 {
            craveBotText.text = messageDict[3]
            print( messageDict[3])
        } else {
            craveBotText.text = messageDict[4]
        }
       
    }

    func sayBadInput(_ n: Int, message: String = "Sorry, I don't understand. ") {
        chefwiggle()
        let personality = chefPersonality[currChefPersonality]
        
        var messageDict = normie
        if (personality == "sassy"){
            messageDict = sassy
        } else if (personality == "edgelord") {
            messageDict = edgelord
        }
        chefwiggle()
        if n == 0 {
            craveBotText.text = message + messageDict[0]!
            query.curr += 1
        } else if n == 1 {
            craveBotText.text = message + messageDict[1]!
        } else if n == 2 {
            craveBotText.text = message + messageDict[2]!
        } else if n == 3 {
            craveBotText.text = message + messageDict[3]!
        } else {
            craveBotText.text = messageDict[4]
        }
        //print(craveBotText.text!)
    }


    // Not Ideal Implementation! but makes animation loop 3 times
    func chefwiggle() {
        chefAnimation?.play { (finished) in
            self.chefAnimation?.play() {(finished) in self.chefAnimation?.play()}
        }

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "swipeLeft"){
            if let dest = segue.destination as? RestaurantViewController {
                dest.restaurantList = restaurantList
            }
        }
    }
    
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if (restaurantList.count == 0){
            return false
        }
         print(restaurantList.count)
        return true

    }
}

extension UIViewController {
    @objc func swipeAction(swipe:UISwipeGestureRecognizer) {
        switch swipe.direction.rawValue {
        case 1:
            if (shouldPerformSegue(withIdentifier: "swipeRight", sender: self)){
                performSegue(withIdentifier: "swipeRight", sender: self)
            }
        case 2:
            if (shouldPerformSegue(withIdentifier: "swipeLeft", sender: self)){
                performSegue(withIdentifier: "swipeLeft", sender: self)
            }
        default:
            break
        }
    }
    
}
