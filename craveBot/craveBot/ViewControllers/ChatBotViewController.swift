//
//  chatBotViewController.swift
//  craveBot
//
//  Created by Jennifer Xiao on 4/13/19.
//  Copyright © 2019 CraveProject. All rights reserved.
//

import Foundation
import UIKit
import SwiftyJSON

class ChatBotViewController: UIViewController {
    
    var restaurantList : [Restaurant] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func tempButton(_ sender: Any) {
        performSegue(withIdentifier: "chatbotToRestaurantSegue", sender: self)
    }
    
    func getNextMesssage() -> String{
        return ""
    }
    
    func getBackgroundImage() -> UIImage {
        return UIImage()
    }
    
    func changeBackgroundImage(){
        
    }
    
    func getRestaurantList(){
        //test: with preloaded json
        let path = Bundle.main.path(forResource: "data", ofType: "json")
        
        print(path)
        let jsonData = NSData(contentsOfFile:path!)
        do {
            let json = try JSON(data: jsonData! as Data)
            let jsonList = json["businesses"].arrayValue.map {$0["name"].stringValue}
            for item in jsonList {
                let restarauntJSON = JSON(item)
                restaurantList.append(Restaurant(json: restarauntJSON))
            }
            print("success")
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "chatbotToRestaurantSegue"){
            if let dest = segue.destination as? RestaurantViewController {
                
                getRestaurantList()
                dest.restaurantList = restaurantList
            }
        }
    }

}
