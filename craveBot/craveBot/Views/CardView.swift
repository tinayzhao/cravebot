//
//  CardView.swift
//  craveBot
//
//  Created by Jennifer Xiao on 4/16/19.
//  Copyright © 2019 CraveProject. All rights reserved.
//

import Foundation
import FloatRatingView

import UIKit

class CardView: UIView, FloatRatingViewDelegate {
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var RestaurantName: UILabel!
    @IBOutlet weak var rating: FloatRatingView!
    @IBOutlet weak var address: UILabel!
    @IBOutlet weak var distance: UILabel!
    @IBOutlet weak var hours: UILabel!
    @IBOutlet weak var dollarSigns: UILabel!
    @IBOutlet weak var openStatus: UILabel!
    
    var restaurant: Restaurant!
    
    class func instanceFromNib() -> CardView {
        
        return UINib(nibName: "CardView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! CardView
    }
    
    
}


extension UIView {
    
    public func addBorder(width:CGFloat,color:UIColor){
        self.layer.borderWidth = width
        self.layer.borderColor = color.cgColor
    }
    public func cornerRadius(radius:CGFloat){
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = true
    }
    public func gradient(colorTop:UIColor,colorBottom:UIColor,frame:CGRect,fromTop:Bool=false){
        let gl = CAGradientLayer()
        gl.frame = frame
        gl.colors = [colorTop.cgColor, colorBottom.cgColor]
        if fromTop {
            gl.locations = [0.0, 1.0]
        }
        else {
            gl.locations = [1.0, 1.0]
        }
        self.layer.addSublayer(gl)
    }
    
    func addShadow(){
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 1
        self.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        self.layer.shadowRadius = 8
        self.layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        //        self.layer.shouldRasterize = true
    }
    func addShadowOnBottom(cornerRadius:CGFloat?=nil){
        self.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5).cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 3
        self.layer.masksToBounds = false
        self.layer.cornerRadius = cornerRadius ?? self.frame.height/2
    }
    
    
    
}
