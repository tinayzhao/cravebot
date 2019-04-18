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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func tempRestaurantTest(_ sender: Any) {
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "chatbotToRestaurantSegue"){
            if let dest = segue.destination as? RestaurantViewController {
                let path = Bundle.main.path(forResource: "data.json", ofType: "Data", inDirectory: "craveBot/Models")
                let json = JSON(data: path)
                dest.restaurantList = json["businesses"]
            }
        }
    }

}
