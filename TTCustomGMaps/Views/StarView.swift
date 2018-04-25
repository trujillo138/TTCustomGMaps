//
//  StarView.swift
//  TTCustomGMaps
//
//  Created by Tomas Trujillo on 4/24/18.
//  Copyright © 2018 TomApps. All rights reserved.
//

import UIKit

struct StarViewModel {
    var filled: Bool
}

class StarView: UIView {
    
    //MARK: Properties
    private var bottomPointsInset: CGFloat {
        return bounds.width * 0.15
    }
    private var bottomCapSeparatorXInset: CGFloat {
        return bounds.width * 0.2
    }
    private var bottomCapSeparatorYInset: CGFloat {
        return bounds.height * 0.3
    }
    private var upperCapSeparatoyXInset: CGFloat {
        return bounds.width * 0.3
    }
    private var upperCapSeparatoyYInset: CGFloat {
        return bounds.height * 0.4
    }
    private var topMidPointInset: CGFloat {
        return bounds.height * 0.1
    }
    private var bottomMidPointInset: CGFloat {
        return bounds.height * 0.2
    }
    private var filled = false

    //MARK: Drawing
    
    override func draw(_ rect: CGRect) {
        let height = bounds.height
        let width = bounds.width
        let star = UIBezierPath()
        star.move(to: CGPoint(x: bottomPointsInset, y: height))
        star.addLine(to: CGPoint(x: bottomCapSeparatorXInset, y: height - bottomCapSeparatorYInset))
        star.addLine(to: CGPoint(x: 0.0, y: height / 2))
        star.addLine(to: CGPoint(x: upperCapSeparatoyXInset, y: upperCapSeparatoyYInset))
        star.addLine(to: CGPoint(x: width / 2, y: topMidPointInset))
        star.addLine(to: CGPoint(x: width - upperCapSeparatoyXInset, y: upperCapSeparatoyYInset))
        star.addLine(to: CGPoint(x: width, y: height / 2))
        star.addLine(to: CGPoint(x: width - bottomCapSeparatorXInset, y: height - bottomCapSeparatorYInset))
        star.addLine(to: CGPoint(x: width - bottomPointsInset, y: height))
        star.addLine(to: CGPoint(x: width / 2, y: height - bottomMidPointInset))
        star.addLine(to: CGPoint(x: bottomPointsInset, y: height))
        star.lineJoinStyle = .round
        if filled {
            UIColor.blue.setFill()
            star.fill()
        } else {
            UIColor.blue.setStroke()
            star.stroke()
        }
    }
    
    private func setup() {
        backgroundColor = .clear
        contentMode = .redraw
        isOpaque = false
    }
    
    //MARK: Initializers
    convenience init(frame: CGRect, model: StarViewModel) {
        self.init(frame: frame)
        self.filled = model.filled
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

}
