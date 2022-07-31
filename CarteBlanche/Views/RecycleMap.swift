//
//  RecycleMap.swift
//  CarteBlanche
//
//  Created by Sky on 2022/7/28.
//

import SwiftUI

struct RecycleMap: View {
    @ObservedObject var viewModel: ViewModel
    var body: some View {
        Text("RecycleMap!")
        Button("Back"){viewModel.currentView = "Home"}
    }
}

//struct RecycleMap_Previews: PreviewProvider {
//    static var previews: some View {
//        RecycleMap()
//    }
//}
