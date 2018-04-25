//
//  MapInfoView.swift
//  TTCustomGMaps
//
//  Created by Tomas Trujillo on 4/11/18.
//  Copyright © 2018 TomApps. All rights reserved.
//

import UIKit

class MapInfoView: UIView {

    //MARK: Properties
    
    private var infoContainerView: UIView!
    private var infoImageView: UIImageView!
    private var infoLabel: UILabel!
    private var detailLabel: UILabel!
    private var infoButton: UIButton!
    private var infoStarView: StarViewCollection!
    private var bottomArrowViewSize: CGFloat {
        return bounds.width * 0.15
    }
    private var imageViewSize: CGFloat {
        return bounds.height * 0.3
    }
    private var buttonMapViewSize: CGFloat {
        return bounds.height * 0.15
    }
    private var starViewSize: CGSize {
        return CGSize(width: bounds.width * 0.6, height: bounds.height * 0.2)
    }
    private let infoViewBackgroundColor = UIColor.white
    
    //MARK: Drawing
    
    private func setup() {
        backgroundColor = .clear
        isOpaque = false
        insertContainerView()
        insertBottomArrowView()
        insertMapInfoImageView()
        insertMapInfoActionButton()
        insertMapInfoStarView()
        insertMapInfoLabel()
        insertMapInfoDetailLabel()
    }
    
    private func insertContainerView() {
        let containerView = UIView(frame: .zero)
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.layer.cornerRadius = bounds.height * 0.1
        containerView.layer.masksToBounds = true
        containerView.backgroundColor = infoViewBackgroundColor
        addSubview(containerView)
        NSLayoutConstraint.activate([containerView.topAnchor.constraint(equalTo: topAnchor),
                                     containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
                                     containerView.trailingAnchor.constraint(equalTo: trailingAnchor),
                                     containerView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -bottomArrowViewSize)])
        self.infoContainerView = containerView
    }
    
    private func insertBottomArrowView() {
        let arrowView = UIView(frame: .zero)
        arrowView.translatesAutoresizingMaskIntoConstraints = false
        arrowView.backgroundColor = infoViewBackgroundColor
        insertSubview(arrowView, belowSubview: infoContainerView)
        NSLayoutConstraint.activate([arrowView.topAnchor.constraint(equalTo: infoContainerView.bottomAnchor, constant: -2),
                                     arrowView.centerXAnchor.constraint(equalTo: infoContainerView.centerXAnchor),
                                     arrowView.heightAnchor.constraint(equalToConstant: bottomArrowViewSize),
                                     arrowView.widthAnchor.constraint(equalToConstant: bottomArrowViewSize)])
        let arrowPath = UIBezierPath()
        arrowPath.move(to: .zero)
        arrowPath.addLine(to: CGPoint(x: bottomArrowViewSize / 2, y: bottomArrowViewSize))
        arrowPath.addLine(to: CGPoint(x: bottomArrowViewSize, y: 0.0))
        arrowPath.close()
        let arrowMask = CAShapeLayer()
        arrowMask.path = arrowPath.cgPath
        arrowView.layer.mask = arrowMask
        arrowView.layer.masksToBounds = true
    }
    
    private func insertMapInfoImageView() {
        guard let image = UIImage(named: "mapImage") else { return }
        let imageView = UIImageView(frame: .zero)
        imageView.image = image
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .clear
        infoContainerView.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([imageView.topAnchor.constraint(equalTo: infoContainerView.topAnchor, constant: 8.0),
                                     imageView.leadingAnchor.constraint(equalTo: infoContainerView.leadingAnchor, constant: 8.0),
                                     imageView.heightAnchor.constraint(equalToConstant: imageViewSize),
                                     imageView.widthAnchor.constraint(equalToConstant: imageViewSize)])
        self.infoImageView = imageView
    }
    
    private func insertMapInfoActionButton() {
        let infoButtonMapView = UIButton(type: .detailDisclosure)
        infoContainerView.addSubview(infoButtonMapView)
        infoButtonMapView.translatesAutoresizingMaskIntoConstraints = false
        infoButtonMapView.addTarget(self, action: #selector(tappedActionButton), for: .touchUpInside)
        NSLayoutConstraint.activate([infoButtonMapView.widthAnchor.constraint(equalToConstant: buttonMapViewSize),
                                     infoButtonMapView.heightAnchor.constraint(equalToConstant: buttonMapViewSize),
                                     infoButtonMapView.trailingAnchor.constraint(equalTo: infoContainerView.trailingAnchor, constant: -8.0),
                                     infoButtonMapView.centerYAnchor.constraint(equalTo: infoContainerView.centerYAnchor)])
        self.infoButton = infoButtonMapView
    }
    
    private func insertMapInfoLabel() {
        let label = UILabel(frame: .zero)
        label.text = "This is a restaurant"
        label.font = UIFont.systemFont(ofSize: 13)
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        infoContainerView.addSubview(label)
        NSLayoutConstraint.activate([label.leadingAnchor.constraint(equalTo: self.infoImageView.trailingAnchor, constant: 8.0),
                                     label.trailingAnchor.constraint(equalTo: self.infoButton.leadingAnchor, constant: 0.0),
                                     label.topAnchor.constraint(equalTo: self.infoImageView.topAnchor)])
        label.setContentHuggingPriority(UILayoutPriority.defaultHigh, for: .vertical)
        self.infoLabel = label
    }
    
    private func insertMapInfoDetailLabel() {
        let label = UILabel(frame: .zero)
        label.text = "Food services"
        label.font = UIFont.systemFont(ofSize: 11)
        label.textColor = UIColor.lightGray
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        infoContainerView.addSubview(label)
        NSLayoutConstraint.activate([label.leadingAnchor.constraint(equalTo: self.infoLabel.leadingAnchor),
                                     label.trailingAnchor.constraint(equalTo: self.infoLabel.trailingAnchor),
                                     label.topAnchor.constraint(equalTo: self.infoLabel.bottomAnchor)])
        self.detailLabel = label
    }
    
    private func insertMapInfoStarView() {
        let starView = StarViewCollection(frame: .zero, stars: [StarViewModel(filled: true), StarViewModel(filled: true),
                                                                StarViewModel(filled: true), StarViewModel(filled: false), StarViewModel(filled: false)])
        starView.translatesAutoresizingMaskIntoConstraints = false
        self.infoContainerView.addSubview(starView)
        NSLayoutConstraint.activate([starView.widthAnchor.constraint(equalToConstant: starViewSize.width),
                                     starView.heightAnchor.constraint(equalToConstant: starViewSize.height),
                                     starView.leadingAnchor.constraint(equalTo: infoContainerView.leadingAnchor, constant: 15.0),
                                     starView.bottomAnchor.constraint(equalTo: infoContainerView.bottomAnchor, constant: -8.0)])
        self.infoStarView = starView
    }
    
    //MARK: Actions
    
    @objc func tappedActionButton(sender: UIButton) {
        print("Tapped button")
    }
    
    //MARK: Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

}
