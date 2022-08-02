//
//  RecycleMap.swift
//  CarteBlanche
//
//  Created by Sky on 2022/7/28.
//

import SwiftUI
import MapKit


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
    @State var subviewSwitcher = 0
    
    var body: some View {
        VStack{
            Button("Back"){viewModel.recycleMapView = "Home"}
            Picker(selection: $subviewSwitcher, label: Text(""), content: {
                Text("Map").tag(0)
                Text("List").tag(1)
            }).pickerStyle(SegmentedPickerStyle())
            
            if subviewSwitcher == 1 {
                Text("Here are some locations where you can recycle your items:\n")
                    .multilineTextAlignment(.center)
                Spacer()
                if (viewModel.hasEWaste || viewModel.hasBottles || viewModel.hasCardboard || viewModel.hasBatteries){
                    Button("You can recycle all of the following at the Nillumbik Recycling Centre:")
                    {
                        let latitude = -37.65445841223325
                        let longitude = 145.12588789390205
                        let url = URL(string: "maps://?saddr=&daddr=\(latitude),\(longitude)")
                        if UIApplication.shared.canOpenURL(url!) {
                            UIApplication.shared.open(url!, options: [:], completionHandler: nil)
                        }
                    }
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
                    Button("\nYou can recycle your batteries at your local Woolworths Supermarket.")
                    {
                        let latitude = -37.71403012349992
                        let longitude = 145.14990344750103
                        let url = URL(string: "maps://?saddr=&daddr=\(latitude),\(longitude)")
                        if UIApplication.shared.canOpenURL(url!) {
                            UIApplication.shared.open(url!, options: [:], completionHandler: nil)
                        }
                    }
                    .multilineTextAlignment(.center)
                }
                
                if (viewModel.hasBatteries || viewModel.hasEWaste){
                    Button("\nYou can recycle the following small items at the Eltham Library:")
                    {
                        let latitude = -37.71618382924889
                        let longitude = 145.14595414465242
                        let url = URL(string: "maps://?saddr=&daddr=\(latitude),\(longitude)")
                        if UIApplication.shared.canOpenURL(url!) {
                            UIApplication.shared.open(url!, options: [:], completionHandler: nil)
                        }
                    }
                    
                    .multilineTextAlignment(.center)
                    if (viewModel.hasEWaste){
                        Text("💻 Small E-waste Items")
                    }
                    if (viewModel.hasBatteries){
                        Text("🪫 Batteries")
                    }
                }
                
                Spacer()
                
            }
        }
        if subviewSwitcher == 0 {
            RecycleMap_Map(viewModel: viewModel)
        }
    }
}









//struct RecycleMap_Previews: PreviewProvider {
//    static var previews: some View {
//        RecycleMap()
//    }
//}
