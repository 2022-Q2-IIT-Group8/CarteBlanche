//
//  ContentView.swift
//  CarteBlanche
//
//  Created by Sky on 2022/7/28.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = ViewModel()
    
    var body: some View {
        VStack {
            
            switch viewModel.currentView {
            case "Ingredient2Recipe":
                Ingredient2Recipe(viewModel: viewModel)
            case "RecycleMap":
                RecycleMap(viewModel: viewModel)
            case "RecycleCalendar":
                RecycleCalendar(viewModel: viewModel)
            case "Home":
                Home(viewModel: viewModel)
            default:
                BadState()
            }
        }
    }
}

struct Home: View {
    var viewModel: ViewModel
    var body: some View {
        VStack{
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Let's recycle!")
            Button("Ingredients to Recipe Finder!"){viewModel.currentView = "Ingredient2Recipe"}
            Button("Recycling Map!"){viewModel.currentView = "RecycleMap"}
            Button("Council Bin Calendar!"){viewModel.currentView = "RecycleCalendar"}
            
        }
    }
}

struct BadState: View {
    var body: some View {
        Text("Whoops! Looks like someonne shouldn't be storing state in a string like a total noob!")
        Text("Couldn't you be bothered using enums for heavens sake?")
        Text("NAH JUST A PROTOTYPE, WE CAN FUDGE IT FOR NOW")
    }
}

//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
