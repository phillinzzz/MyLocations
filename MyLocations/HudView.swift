//
//  HudView.swift
//  MyLocations
//
//  Created by 戴林 on 2018/9/4.
//  Copyright © 2018年 potatosoft.co.ltd. All rights reserved.
//

import UIKit
class HudView: UIView {
    var text = ""
    
    class func hud(inView view: UIView, animated: Bool) -> HudView {
        
        let hudView = HudView(frame: view.bounds)
        
        hudView.isOpaque = false
        
        view.addSubview(hudView)
        view.isUserInteractionEnabled = false
        
        //hudView.backgroundColor = UIColor(red: 1, green: 0, blue: 0, alpha: 0.5)
        hudView.show(animated: animated)
        
        return hudView
    }
    
    // MARK:- Public methods
    func show(animated: Bool) {
        
        if animated {
            
            alpha = 0
            transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
            
//            UIView.animate(withDuration: 10.3, animations: {
//
//                self.alpha = 1
//                self.transform = CGAffineTransform.identity
//            })
            
            UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.5, options: [], animations: {
                self.alpha = 1
                self.transform = CGAffineTransform.identity
            }, completion: nil)
        }
    }
    
    func hide(animated: Bool) {
        
        if animated {
            
            UIView.animate(withDuration: 1.0, animations: {
                self.alpha = 0
            }, completion: nil)
        }
        let delayInSeconds = 1.0
//        DispatchQueue.main.asyncAfter(deadline: .now() + delayInSeconds, execute: {
//            self.superview?.isUserInteractionEnabled = true
//            self.removeFromSuperview()
//            //navigationController?.popViewController(animated: true)
//        })
        afterDelay(delayInSeconds) {
            self.superview?.isUserInteractionEnabled = true
            self.removeFromSuperview()
        }
        

    }
    
    override func draw(_ rect: CGRect) {
        print("drawing***")
        let boxWidth: CGFloat = 96
        let boxHeight: CGFloat = 96
        let boxRect = CGRect(x: round((bounds.size.width - boxWidth)/2),
                             y: round((bounds.size.height - boxHeight)/2),
                             width: boxWidth,
                             height: boxHeight)
        
        let roundedRect = UIBezierPath(roundedRect: boxRect, cornerRadius: 10)
        UIColor(white: 0.3, alpha: 0.8).setFill()
        roundedRect.fill()
        
        // Draw checkmark
        if let image = UIImage(named: "Checkmark") {
            let imagePoint = CGPoint(x: center.x - round(image.size.width / 2),
                                     y: center.y - round(image.size.height / 2 )  - boxHeight / 8)
            image.draw(at: imagePoint)
        }
        
        // Draw the text
        let attribs = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16),
                       NSAttributedString.Key.foregroundColor: UIColor.white]
        
        let textSize = text.size(withAttributes: attribs)
        
        let textPoint = CGPoint(x: center.x - round(textSize.width / 2), y: center.y - round(textSize.height / 2) + boxHeight / 4)
        
        text.draw(at: textPoint, withAttributes: attribs)
        
        
    }
    
}
