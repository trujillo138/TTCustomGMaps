//
//  PlaceDetailViewController.swift
//  TTCustomGMaps
//
//  Created by Tomas Trujillo on 4/30/18.
//  Copyright © 2018 TomApps. All rights reserved.
//

import UIKit

class PlaceDetailViewController: UIViewController {

    //MARK: Properties
    @IBOutlet private weak var placeImage: UIImageView!
    @IBOutlet private weak var starViewCollection: StarViewCollection!
    @IBOutlet private weak var placeDescriptionTextArea: UITextView!
    var place: Place?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadPlaceDetails()
    }

    private func loadPlaceDetails() {
        guard let place = self.place else { return }
        placeDescriptionTextArea.text = place.description
        let manager = PlaceManager()
        starViewCollection.starModels = manager.starViewModelForScore(place.score)
        placeImage.image = UIImage(named: place.imageURL)
        self.title = place.name
    }

}
