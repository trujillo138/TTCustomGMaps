//
//  StarViewCollection.swift
//  TTCustomGMaps
//
//  Created by Tomas Trujillo on 4/24/18.
//  Copyright © 2018 TomApps. All rights reserved.
//

import UIKit

class StarViewCollection: UIView {

    //MARK: Properties
    private let paddingBetweenStars: CGFloat = 4.0
    var starModels: [StarViewModel] = [] {
        didSet {
            self.setNeedsDisplay()
        }
    }
    private var stars: [StarView] = []
    
    //MARK: Drawing
    
    override func draw(_ rect: CGRect) {
        for star in stars {
            star.removeFromSuperview()
        }
        stars = []
        insertStars()
    }
    
    private func insertStars() {
        let numberOfStars = CGFloat(starModels.count)
        let paddingDistance = (numberOfStars + 1.0) * paddingBetweenStars
        let widthMultiplierPerStar = ((bounds.width - paddingDistance) / numberOfStars) / bounds.width
        var previousStar: StarView? = nil
        for starModel in starModels {
            let starView = StarView(frame: .zero, model: starModel)
            starView.translatesAutoresizingMaskIntoConstraints = false
            addSubview(starView)
            var constraints: [NSLayoutConstraint] = []
            constraints.append(starView.heightAnchor.constraint(equalTo: self.widthAnchor, multiplier: widthMultiplierPerStar))
            constraints.append(starView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: widthMultiplierPerStar))
            constraints.append(starView.centerYAnchor.constraint(equalTo: self.centerYAnchor))
            if let previousView = previousStar {
                //Not the frist star
                constraints.append(starView.leadingAnchor.constraint(equalTo: previousView.trailingAnchor, constant: paddingBetweenStars))
            } else {
                //First star
                constraints.append(starView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: paddingBetweenStars))
            }
            previousStar = starView
            NSLayoutConstraint.activate(constraints)
            stars.append(starView)
        }
    }
    
    //MARK: Intializers
    
    private func setup() {
        backgroundColor = .clear
        isOpaque = false
        contentMode = .redraw
    }
    
    //MARK: Initializers
    
    convenience init(frame: CGRect, stars: [StarViewModel]) {
        self.init(frame: frame)
        self.starModels = stars
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
