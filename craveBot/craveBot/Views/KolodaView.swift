//
//  extension of Koloda View.swift
//  craveBot
//
//  Created by Jennifer Xiao on 4/19/19.
//  Copyright © 2019 CraveProject. All rights reserved.
//

import Foundation
import UIKit
import Koloda
/*
extension KolodaView {
    
    func createCard(at index: Int, frame: CGRect? = nil) -> DraggableCardView {
        let cardView = generateCard(frame ?? frameForTopCard())
        configureCard(cardView, at: index)
        
        return cardView
    }
    
    func generateCard(_ frame: CGRect) -> DraggableCardView {
        let cardView = DraggableCardView(frame: frame)
        cardView.delegate = self
        
        return cardView
    }
    
    func configureCard(_ card: DraggableCardView, at index: Int) {
        let contentView = dataSource!.koloda(self, viewForCardAt: index)
        card.configure(contentView, overlayView: dataSource?.koloda(self, viewForCardOverlayAt: index))
        
        //Reconfigure drag animation constants from Koloda instance.
        if let rotationMax = self.rotationMax {
            card.rotationMax = rotationMax
        }
        card.scrollIsAvailable = self.scrollIsAvailable
        if let rotationAngle = self.rotationAngle {
            card.rotationAngle = rotationAngle
        }
        if let scaleMin = self.scaleMin {
            card.scaleMin = scaleMin
        }
    }
    
}
 */
