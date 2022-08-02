//
//  RecycleCalendar.swift
//  CarteBlanche
//
//  Created by Sky on 2022/7/28.
//

import SwiftUI

struct RecycleCalendar: View {
    var viewModel: ViewModel
    @State private var date = Date()
    
    var body: some View {
        Text("View your next collection dates:")
        DatePicker(
            "",
            selection: $date,
            displayedComponents: [.date]
        )
        .datePickerStyle(.graphical)

        Button("Back"){withAnimation(){viewModel.currentView = "Home"}}
    }
}
//
//struct RecycleCalendar_Previews: PreviewProvider {
//    static var previews: some View {
//        RecycleCalendar()
//    }
//}
