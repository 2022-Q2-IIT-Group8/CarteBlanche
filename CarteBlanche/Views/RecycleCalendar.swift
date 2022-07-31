//
//  RecycleCalendar.swift
//  CarteBlanche
//
//  Created by Sky on 2022/7/28.
//

import SwiftUI

struct RecycleCalendar: View {
    var viewModel: ViewModel
    var body: some View {
        Text("RecycleCalendar!")
        Button("Back"){viewModel.currentView = "Home"}
    }
}
//
//struct RecycleCalendar_Previews: PreviewProvider {
//    static var previews: some View {
//        RecycleCalendar()
//    }
//}
