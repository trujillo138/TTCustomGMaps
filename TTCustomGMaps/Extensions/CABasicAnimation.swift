//
//  CABasicAnimation.swift
//  TTCustomGMaps
//
//  Created by Tomas Trujillo on 4/24/18.
//  Copyright © 2018 TomApps. All rights reserved.
//

import UIKit

extension CABasicAnimation {
    
    class func addRotationAnimation(toView view: UIView) {
        let rotationAnimation = CAKeyframeAnimation(keyPath: "transform.rotation.y")
        rotationAnimation.values = [0.0, 0.0, CGFloat.pi, 2.0 * CGFloat.pi]
        rotationAnimation.duration = 4.0
        rotationAnimation.repeatCount = .greatestFiniteMagnitude
        rotationAnimation.fillMode = kCAFillModeBackwards
        view.layer.add(rotationAnimation, forKey: nil)
    }
    
}
