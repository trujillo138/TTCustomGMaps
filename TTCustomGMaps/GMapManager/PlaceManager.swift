//
//  PlaceManager.swift
//  TTCustomGMaps
//
//  Created by Tomas Trujillo on 4/30/18.
//  Copyright © 2018 TomApps. All rights reserved.
//

import Foundation


class PlaceManager {
    
    func starViewModelForScore(_ score: Int) -> [StarViewModel] {
        var starViewModels: [StarViewModel] = []
        for i in 0..<5 {
            let filled = i < score
            starViewModels.append(StarViewModel(filled: filled))
        }
        return starViewModels
    }
    
}
