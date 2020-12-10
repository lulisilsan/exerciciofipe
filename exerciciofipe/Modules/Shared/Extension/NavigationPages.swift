//
//  NavigationPages.swift
//  exerciciofipe
//
//  Created by Luciana on 09/12/20.
//

import UIKit


extension UINavigationBar {
        
        func makeClear() {
            
            barStyle = .default
            barTintColor = .clear
            backgroundColor = .clear
            setBackgroundImage(UIImage(), for: .default)
            isTranslucent = true
            addNewBlur()
            
        }
        
        
        
        func addNewBlur() {
            
            let statusBarHeight = UIApplication.shared.statusBarFrame.size.height
            let bounds = self.bounds.insetBy(dx: 0, dy: -(statusBarHeight)).offsetBy(dx: 0, dy: -(statusBarHeight))
            
           
            // Create blur effect.
            let visualEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .regular))
            visualEffectView.isUserInteractionEnabled = false
            visualEffectView.frame = bounds
            visualEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            
            visualEffectView.layer.zPosition = -1;
            self.addSubview(visualEffectView);
            self.sendSubviewToBack(visualEffectView);
            
        }
        
}

