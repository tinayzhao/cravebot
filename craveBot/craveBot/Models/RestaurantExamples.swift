//
//  RestaurantExamples.swift
//  craveBot
//
//  Created by Jennifer Xiao on 4/18/19.
//  Copyright © 2019 CraveProject. All rights reserved.
//

import Foundation
/*

class UIRestaurantView: KolodaView  {
    
    var name = ""
    var address = ""
    var cost = 1
    var open =  false
    var imageURL = ""
    
    @IBOutlet var image: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var addressLabel: UILabel!
    @IBOutlet var costLabel: UILabel!
    @IBOutlet var openLabel: UILabel!
    
    /*
     // Only override drawRect: if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func drawRect(rect: CGRect) {
     // Drawing code
     }
     */
    
    //below was copied from the Koloda example from git lol
    
    let defaultTopOffset: CGFloat = 20
    let defaultHorizontalOffset: CGFloat = 10
    let defaultHeightRatio: CGFloat = 1.25
    let backgroundCardHorizontalMarginMultiplier: CGFloat = 0.25
    let backgroundCardScalePercent: CGFloat = 1.5
    
    
    override func frameForCard(at index: Int) -> CGRect {
        if index == 0 {
            let topOffset: CGFloat = defaultTopOffset
            let xOffset: CGFloat = defaultHorizontalOffset
            let width = (self.frame).width - 2 * defaultHorizontalOffset
            let height = width * defaultHeightRatio
            let yOffset: CGFloat = topOffset
            let frame = CGRect(x: xOffset, y: yOffset, width: width, height: height)
            
            return frame
        } else if index == 1 {
            let horizontalMargin = -self.bounds.width * backgroundCardHorizontalMarginMultiplier
            let width = self.bounds.width * backgroundCardScalePercent
            let height = width * defaultHeightRatio
            return CGRect(x: horizontalMargin, y: 0, width: width, height: height)
        }
        return CGRect.zero
    }
}
*/
