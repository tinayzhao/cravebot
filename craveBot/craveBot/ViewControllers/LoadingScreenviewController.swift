//
//  ViewController.swift
//  craveBot
//
//  Created by Jennifer Xiao on 4/13/19.
//  Copyright © 2019 CraveProject. All rights reserved.
//

import UIKit
import Lottie

class LoadingScreenViewController: UIViewController {

    var logoAnimation: AnimationView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        logoAnimation = AnimationView(name: "logoZoom")
        logoAnimation?.isUserInteractionEnabled = false
        logoAnimation?.frame = CGRect.init(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        let center = self.view.center
        logoAnimation?.center = center
        self.view.addSubview(logoAnimation!)
        
        
        
        
            }
    override func viewDidAppear(_ animated: Bool) {
        sleep(2)
        
        logoAnimation?.play(completion: { (true) in
            self.performSegue(withIdentifier: "toBotSegue", sender: nil)
            
        })

        
    }


}

