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

class TempChatBotViewController: UIViewController, CLLocationManagerDelegate {

    var chefAnimation: AnimationView?
    var questionNumber: Int = 0

    @IBOutlet var craveBotText: CLTypingLabel!
    @IBOutlet var input: UITextField!
    @IBOutlet var sendButton: UIButton!

    var query = Query()
    var restaurantList: [Restaurant] = []

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

        let userInput = input.text
        query.message = userInput
        updateInfo(questionNumber, userInput!)
        let json = query.getDictObject()
        //let postParameters = JSONSerialization.data(withJSONObject: json, options: .prettyPrinted)
        let url = "http://localhost:5000/api/backend"

        Alamofire.request(url, method: .post, parameters: json, encoding: JSONEncoding.default).validate().responseJSON { response in
            switch response.result {
                case .success(let value):
                    let json = JSON(value)
                    print("JSON: \(json)")

                    let messageData = json["message"].stringValue
                    if (messageData == "") {
                        self.sayBadInput(messageData)
                        self.deleteInfo(self.questionNumber)
                        self.askQuestion(self.questionNumber)
                    } else {
                        let resData = JSON(json["restaurants"].dictionaryObject)
                        self.updateRestaurantList(resData)
                        self.questionNumber += 1
                    }
                case .failure(let error):
                    print(error)
                    self.sayBadInput()
                    self.deleteInfo(self.questionNumber)
            }
        }
    }

    func updateRestaurantList(_ jsonData: JSON){
        //test: with preloaded json
        //let path = Bundle.main.path(forResource: "restaurant", ofType: "json")

        //print(path)
        //let jsonData = NSData(contentsOfFile:path!)
        do {
            let json = try JSON(jsonData)
            //print(json)
            let jsonList = json.arrayValue
            for item in jsonList {
                print(item)
                let restarauntJSON = JSON(item)
                print(restarauntJSON)
                restaurantList.append(Restaurant(json: restarauntJSON))
            }
            // print("success")
        }catch let error {
            print(error.localizedDescription)
        }

        /*do {
         //  let data = try Data(contentsOf: URL(fileURLWithPath: path!), options: .alwaysMapped)
         // if let dataFromString = data.data(using: .utf8, allowLossyConversion: false) {
         //   let json = JSON(data: dataFromString)
         // let restaurantList = json["businesses"]
         }
         //let jsonObj = JSONSerializer.toJson(data)
         //print(jsonObj)
         //let json = JSON(data: data)

         } catch let error {
         print(error.localizedDescription)
         }
         */
    }

    func updateInfo(_ currentQuestion: Int, _ newData: String) {
        if currentQuestion == 0 {
            query.location = newData
        } else if currentQuestion == 1 {
            query.category = newData
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
            query.category = nil
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

    func sayBadInput(_ message: String = "Sorry, I don't understad.") {
        craveBotText.text = message
    }


    // Not Ideal Implementation! but makes animation loop 3 times
    func chefwiggle() {
        chefAnimation?.play { (finished) in
            self.chefAnimation?.play() {(finished) in self.chefAnimation?.play()}
        }

    }




}
