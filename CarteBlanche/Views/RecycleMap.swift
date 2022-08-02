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
        switch viewModel.recycleMapView {
        case "Add":
            RecycleMap_Add(viewModel: viewModel)
        case "List":
            RecycleMap_List(viewModel: viewModel)
        case "Locations":
            RecycleMap_Locations(viewModel: viewModel)
        case "Home":
            RecycleMap_Home(viewModel: viewModel)
        case "Mockup":
            RecycleMap_MapMockup(viewModel: viewModel)
        default:
            RecycleMap_Home(viewModel: viewModel)
        }
    

    }
}

    
    
struct RecycleMap_Home: View {
    var viewModel: ViewModel
    var body: some View {
        VStack{
            Text("RecycleMap!")
            Button("Add Waste"){viewModel.recycleMapView = "Add"}
            Button("Waste List"){viewModel.recycleMapView = "List"}
            Button("Recycle Locations"){viewModel.recycleMapView = "Locations"}
            Button("Map Mockup"){viewModel.recycleMapView = "Mockup"}
            Button("Back"){viewModel.currentView = "Home"}
            
        }
    }
}

struct RecycleMap_Add: View {
    @ObservedObject var viewModel: ViewModel
    var body: some View {
        Text("Select items you wish to add:")
        Button("E-waste"){viewModel.hasEWaste.toggle()}
            .foregroundColor(viewModel.hasEWaste ? Color.green : Color.red)
        Button("Bottles"){viewModel.hasBottles.toggle()}
            .foregroundColor(viewModel.hasBottles ? Color.green : Color.red)
        Button("Cardboard"){viewModel.hasCardboard.toggle()}
            .foregroundColor(viewModel.hasCardboard ? Color.green : Color.red)
        Button("Batteries"){viewModel.hasBatteries.toggle()}
            .foregroundColor(viewModel.hasBatteries ? Color.green : Color.red)
        
        Button("Back"){viewModel.recycleMapView = "Home"}
            
    }
}


struct RecycleMap_List: View {
    @ObservedObject var viewModel: ViewModel
    var body: some View {
        Text("Here are all of your currently selected items:\n")
            .multilineTextAlignment(.center)
        if (viewModel.hasEWaste){
            Text("💻 E-waste")
        }
        if (viewModel.hasBottles){
            Text("🧃 Bottles")
        }
        if (viewModel.hasCardboard){
            Text("📜 Cardboard")
        }
        if (viewModel.hasBatteries){
            Text("🪫 Batteries")
        }
        Text("\n")
        Button("Back"){viewModel.recycleMapView = "Home"}
            
    }
}


struct RecycleMap_Locations: View {
    @ObservedObject var viewModel: ViewModel
    var body: some View {
        Text("Here are some locations where you can recycle your items:\n")
            .multilineTextAlignment(.center)

        if (viewModel.hasEWaste || viewModel.hasBottles || viewModel.hasCardboard || viewModel.hasBatteries){
            Text("You can recycle all of the following at the Nillumbik Recycling Centre:")
                .multilineTextAlignment(.center)
            if (viewModel.hasEWaste){
                Text("💻 E-waste")
            }
            if (viewModel.hasBottles){
                Text("🧃 Bottles")
            }
            if (viewModel.hasCardboard){
                Text("📜 Cardboard")
            }
            if (viewModel.hasBatteries){
                Text("🪫 Batteries")
            }

        }

        if (viewModel.hasBatteries){
            Text("\nYou can recycle your batteries at your local Woolworths Supermarket.")
                .multilineTextAlignment(.center)
        }

        if (viewModel.hasBatteries || viewModel.hasEWaste){
            Text("\nYou can recycle the following small items at the Eltham Library:")
                .multilineTextAlignment(.center)
            if (viewModel.hasEWaste){
                Text("💻 Small E-waste Items")
            }
            if (viewModel.hasBatteries){
                Text("🪫 Batteries")
            }
        }

        Text("\n")
        Button("Back"){viewModel.recycleMapView = "Home"}

    }
}







struct RecycleMap_MapMockup: View {
    @ObservedObject var viewModel: ViewModel
    var body: some View {
        Text("Here are some locations where you can recycle your items:\n")
            .multilineTextAlignment(.center)
        
        

        Text("Select which items you would like to see on the map:")
                .multilineTextAlignment(.center)
            Text("💻 E-waste")
            Text("🧃 Bottles")
            Text("📜 Cardboard")
            Text("🪫 Batteries")
            Image("Mockup")

        

    
        Text("\n")
        Button("Back"){viewModel.recycleMapView = "Home"}

    }
}




//struct RecycleMap_Previews: PreviewProvider {
//    static var previews: some View {
//        RecycleMap()
//    }
//}
