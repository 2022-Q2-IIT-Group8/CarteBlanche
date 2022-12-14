//
//  ViewModel.swift
//  CarteBlanche
//
//  Created by Sky on 2022/7/28.
//

import Foundation
import SwiftUI


class ViewModel: ObservableObject{
    @Published var currentView = "Home"
    
    
    
    @Published var ingredientView = "Home"
    
    @Published var hasBanana = true
    @Published var hasFlour = false
    @Published var hasRoastChicken = false
    @Published var hasTofu = false
    
    
   
    @Published var recycleMapView = "Home"
    
    @Published var hasEWaste = true
    @Published var hasBottles = false
    @Published var hasCardboard = false
    @Published var hasBatteries = true
    
    let frameSize: CGFloat = 120
    
}
