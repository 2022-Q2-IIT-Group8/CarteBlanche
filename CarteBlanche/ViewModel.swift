//
//  ViewModel.swift
//  CarteBlanche
//
//  Created by Sky on 2022/7/28.
//

import Foundation

class ViewModel: ObservableObject{
    @Published var currentView = "Home"
    
    @Published var hasBanana = true
    @Published var hasFlour = false
    @Published var hasRoastChicken = false
    @Published var hasTofu = false
    
    
    @Published var ingredientView = "Home"
    
    
    @Published var hasEWaste = false
    @Published var hasBottles = false
    @Published var hasCardboard = false
}
