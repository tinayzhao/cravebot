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

class TempChatBotViewController: UIViewController {
    
    var chefAnimation: AnimationView?
    
    @IBOutlet var craveBotText: CLTypingLabel!
    @IBOutlet var input: UITextField!
    @IBOutlet var sendButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        craveBotText.charInterval = 0.05
        
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
        
        craveBotText.text = "Hello! \n What would you like to eat? \n Input the type fam!"
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


