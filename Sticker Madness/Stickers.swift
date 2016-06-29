//
//  Stickers.swift
//  Sticker Madness
//
//  Created by Mehul Ajith on 6/29/16.
//  Copyright © 2016 Mehul Ajith. All rights reserved.
//

import UIKit
import Spring

class Stickers: SpringImageView, UIGestureRecognizerDelegate {

    override init(image: UIImage?) {
        super.init(image: image)
        self.image = image
        self.userInteractionEnabled = true
        
        let pan = UIPanGestureRecognizer(target: self, action: #selector(Stickers.handlePan(_:)))
        let pinch = UIPinchGestureRecognizer(target: self, action: #selector(Stickers.handlePinch(_:)))
        let rotate = UIRotationGestureRecognizer(target: self, action: #selector(Stickers.handleRotate(_:)))
        let presss = UILongPressGestureRecognizer(target: self, action: #selector(Stickers.handleHold))
        
        pan.delegate = self
        pinch.delegate = self
        rotate.delegate = self
        
        self.addGestureRecognizer(rotate)
        self.addGestureRecognizer(pan)
        self.addGestureRecognizer(pinch)
        self.addGestureRecognizer(presss)
   
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(image: nil)
    }
    
    func handlePan(panGestureRecognizer : UIPanGestureRecognizer!) {
        if panGestureRecognizer.state == .Began ||
            panGestureRecognizer.state == .Changed {
        
            let translation = panGestureRecognizer.translationInView(panGestureRecognizer.view)
            
            if let view = panGestureRecognizer.view {
            
                let affinerTransformTranslate = CGAffineTransformTranslate(view.transform, translation.x, translation.y)
                view.transform = affinerTransformTranslate
                panGestureRecognizer.setTranslation(CGPointZero, inView: view)
                
            } else {
            
                print("No View")
            
            }
        
        }
    }
    
    func handlePinch(pinchGestureRecognizer : UIPinchGestureRecognizer!) {
        if pinchGestureRecognizer.state == .Began ||
            pinchGestureRecognizer.state == .Changed {
        
            _ = pinchGestureRecognizer.locationInView(pinchGestureRecognizer.view)
            
            if let view = pinchGestureRecognizer.view {
            
                view.transform = CGAffineTransformScale(view.transform, pinchGestureRecognizer.scale, pinchGestureRecognizer.scale)
                
                pinchGestureRecognizer.scale = 1
                
            }
        
        }
    }
    
    func handleRotate(rotateGestureRecognizer : UIRotationGestureRecognizer!) {
        
        if rotateGestureRecognizer.state == .Began ||
            rotateGestureRecognizer.state == .Changed {
        
            _ = rotateGestureRecognizer.locationInView(rotateGestureRecognizer.view)
        
            if let view = rotateGestureRecognizer.view {
                view.transform = CGAffineTransformRotate(view.transform, rotateGestureRecognizer.rotation)
                rotateGestureRecognizer.rotation = 0    
                
                
            }
            
        
        }
        
    }
    
    func handleHold(longpressGestureRecognizer : UILongPressGestureRecognizer!) {
    
        self.removeFromSuperview()
        
    }
    
    func gestureRecognizer(gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWithGestureRecognizer otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        if gestureRecognizer is UIPanGestureRecognizer || gestureRecognizer is UIRotationGestureRecognizer || gestureRecognizer is UIPinchGestureRecognizer {
            return true
        } else {
            return false
        }
    }
    
    

}